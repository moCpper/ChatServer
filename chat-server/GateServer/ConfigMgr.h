#pragma once
#include"const.h"

struct SectionInfo {
	SectionInfo() = default;
	~SectionInfo() = default;

	SectionInfo(const SectionInfo& src) = default;

	SectionInfo& operator=(const SectionInfo& src) = default;

	std::map<std::string, std::string> _section_datas;
	std::string operator[](const std::string& key) {
		if (_section_datas.find(key) == _section_datas.end()) {
			return "";
		}
		return _section_datas[key];
	}
};

class ConfigMgr{
public:
	ConfigMgr();
	ConfigMgr(const ConfigMgr& src) = default;
	ConfigMgr& operator=(const ConfigMgr& src) = default;
	~ConfigMgr() {
		_config_map.clear();
	}
	SectionInfo operator[](const std::string& section) {
		if (_config_map.find(section) == _config_map.end()) {
			return SectionInfo{};
		}
		return _config_map[section];
	}

	static ConfigMgr& Inst() {
		static ConfigMgr cfg_mgr;
		return cfg_mgr;
	}
private:
	std::map<std::string, SectionInfo> _config_map;
};

