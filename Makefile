git: push

add:
	git add .

commit: add
	git commit -am "ok"

push: commit
	git push origin master

tick: tick-define tick-enable tick-show

tick-define:
	kapacitor -url http://192.168.72.128:32011 define cpu -type stream -tick cpu.tick -dbrp telegraf.autogen
	kapacitor -url http://192.168.72.128:32011 define disk -type stream -tick disk.tick -dbrp telegraf.autogen
	kapacitor -url http://192.168.72.128:32011 define mongo_connection -type stream -tick mongo_connection.tick -dbrp telegraf.autogen
	kapacitor -url http://192.168.72.128:32011 define k8s-cpu -type stream -tick k8s-cpu.tick -dbrp k8s.default
	kapacitor -url http://192.168.72.128:32011 define k8s-memory -type stream -tick k8s-memory.tick -dbrp k8s.default

tick-enable:
	kapacitor -url http://192.168.72.128:32011 enable cpu
	kapacitor -url http://192.168.72.128:32011 enable disk
	kapacitor -url http://192.168.72.128:32011 enable mongo_connection
	kapacitor -url http://192.168.72.128:32011 enable k8s-cpu
	kapacitor -url http://192.168.72.128:32011 enable k8s-memory

tick-show:
	kapacitor -url http://192.168.72.128:32011 show cpu
	kapacitor -url http://192.168.72.128:32011 show disk
	kapacitor -url http://192.168.72.128:32011 show mongo_connection
	kapacitor -url http://192.168.72.128:32011 show k8s-cpu
	kapacitor -url http://192.168.72.128:32011 show k8s-memory
