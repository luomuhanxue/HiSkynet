local skynet = require "skynet"

local svc = {}

svc.handle = function(session,address,cmd,id,...)
	skynet.error("["..skynet.address(address).."]",id,"connected!")
	skynet.send(address,"lua","hello slave"..id)
end

skynet.start(function( )
	--设置lua协议处理函数
	skynet.dispatch("lua",svc.handle)
end)