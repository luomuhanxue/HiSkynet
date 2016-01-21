local skynet = require "skynet"

local svc = {}

svc.handle = function ( session,address,... )
	skynet.error("["..skynet.address(address).."]", ...)
end

skynet.init(function ( )
	
	svc.master = assert(skynet.queryservice(true, "master-service"))

end)

skynet.start(function ( )
	skynet.dispatch("lua", svc.handler)
	
	--方式一，按句柄发消息
	skynet.send(svc.master, "lua", "SLAVE", skynet.getenv "harbor")

end)