#include "MysqlMgr.h"

MysqlMgr::MysqlMgr() {

}

MysqlMgr::~MysqlMgr(){

}

int MysqlMgr::RegUser(const std::string& name, const std::string& email, const std::string& pwd){
	return _dao.RegUser(name, email, pwd);
}

bool MysqlMgr::ChekEmail(const std::string& name, const std::string& email){
	return _dao.CheckEmail(name,email);
}

bool MysqlMgr::UpdatePwd(const std::string& name, const std::string& email){
	return _dao.UpdatePwd(name,email);
}

bool MysqlMgr::CheckPwd(const std::string& name, const std::string& pwd, UserInfo& userInfo){
	return _dao.CheckPwd(name, pwd, userInfo);
}
