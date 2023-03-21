#pragma once

#include <memory>
#include <optional>
#include "haxe_PosInfos.h"

class Main {
public:
	int a;
	
	static int returnCode;

	Main();
	
	static void assert(bool b, std::optional<std::shared_ptr<haxe::PosInfos>> infos = std::nullopt);
	
	static void main();
};
