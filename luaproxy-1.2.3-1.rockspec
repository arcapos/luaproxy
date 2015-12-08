package = "luaproxy"
version = "1.2.3-1"
source = {
	url = "git://github.com/mbalmer/luaproxy",
	tag = "v1.2.3",
}
description = {
	summary = "A Lua proxy to access a Lua state from within another state",
	detailed = "Access a Lua state from within another state.",
	homepage = "http://github.com/mbalmer/luaproxy",
	license = "3-clause BSD",
}
dependencies = {
	"lua >= 5.1",
}
build = {
	type = "builtin",
		modules = {
			["proxy"] = {
			sources = "luaproxy.c"
		},
	},
}
