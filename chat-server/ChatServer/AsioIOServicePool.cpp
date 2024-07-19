#include "AsioIOServicePool.h"

AsioIOServicePool::~AsioIOServicePool(){
	std::cout << "AsioIOServicePool destruct" << endl;
}

AsioIOServicePool::AsioIOServicePool(std::size_t size) : _ioServices(size),_works(size), _nextIOService(0){
	for (size_t i = 0; i < size; i++) {
		_works[i] = std::unique_ptr<Work>(new Work(_ioServices[i]));
	}

	for (size_t i = 0; i < size; i++) {
		_threads[i] = std::thread([this,i]() {
			_ioServices[i].run();
			});
	}
}

boost::asio::io_context& AsioIOServicePool::GetIOService(){	
	auto& service = _ioServices[_nextIOService++];
	if (_nextIOService == _ioServices.size()) {
		_nextIOService = 0;
	}
	return service;
}

void AsioIOServicePool::Stop(){
	//因为仅仅执行work.reset并不能让iocontext从run的状态中退出
	//当iocontext已经绑定了读或写的监听事件后，还需要手动stop该服务。
	for (auto& work : _works) {
		//把服务先停止
		work->get_io_context().stop();
		work.reset();
	}

	for (auto& t : _threads) {
		t.join();
	}
}
