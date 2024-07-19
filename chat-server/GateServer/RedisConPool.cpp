#include "RedisConPool.h"

RedisConPool::RedisConPool(size_t poolSize, const char* host, int port, const char* pwd):
    b_stop_(false),
    poolSize_(poolSize),
    host_(host),
    port_(port){
    for (size_t i{ 0 }; i < poolSize_; i++) {
        auto* context = ::redisConnect(host, port);
        if (context == nullptr || context->err != 0) {
            if (context != nullptr) {
                ::redisFree(context);
            }
            continue;
        }

        auto reply = (redisReply*)::redisCommand(context,"AUTH %s",pwd);
        if (reply->type == REDIS_REPLY_ERROR) {
            std::cout << "认证失败" << std::endl;
            ::freeReplyObject(reply);
            continue;
        }

        //执行成功 释放redisCommand执行后返回的redisReply所占用的内存
        freeReplyObject(reply);
        std::cout << "认证成功" << std::endl;
        connections_.push(context);
    }
}

RedisConPool::~RedisConPool(){
    std::lock_guard<std::mutex> lock{mutex_};
    while (!connections_.empty()) {
        connections_.pop();
    }
}

redisContext* RedisConPool::getConnection(){
    std::unique_lock<std::mutex> lock(mutex_);
    cond_.wait(lock, [this]() {
        if (b_stop_) {
            return true;
        }
        return !connections_.empty();
        });
    //如果停止则直接返回空指针
    if (b_stop_) {
        return nullptr;
    }
    auto* context = connections_.front();
    connections_.pop();
    return context;
}

void RedisConPool::returnConnection(redisContext* context){
    std::lock_guard<std::mutex> lock(mutex_);
    if (b_stop_) {
        return;
    }
    connections_.push(context);
    cond_.notify_one();
}

void RedisConPool::Close(){
    b_stop_ = true;
    cond_.notify_all();
}
