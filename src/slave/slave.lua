local skynet = require "skynet"

skynet.start(function (  )

	--创建slave-service服务
	local svc = assert(skynet.newservice("slave-service"))
	
	skynet.exit()
end)