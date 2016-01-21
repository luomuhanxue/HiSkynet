local skynet = require "skynet"
local skymgr = require "skynet.manager"

--节点启动
skynet.start(function ( )
	--启动master-service服务
	-- 注意：这里使用 uniqueservice 而非 newservice 是为了确保全局唯一
	local svc = assert(skynet.uniqueservice(true,"master-service"))
	
	--起名叫master，可以省略
	-- 注册别名后可以直接按名字发消息
	skymgr.name("MASTER",svc)

	--启动完成
	skynet.exit()
end)