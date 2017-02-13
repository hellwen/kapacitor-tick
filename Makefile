git: push

add:
	git add .

commit: add
	git commit -am "ok"

push: commit
	git push origin master

tick: tick-define tick-enable tick-show

tick-define:
	kapacitor -url http://172.1.14.4:9092 define cpu -type stream -tick cpu.tick -dbrp telegraf.autogen
	kapacitor -url http://172.1.14.4:9092 define mongo_connection -type stream -tick mongo_connection.tick -dbrp telegraf.autogen

tick-enable:
	kapacitor -url http://172.1.14.4:9092 enable cpu
	kapacitor -url http://172.1.14.4:9092 enable mongo_connection

tick-show:
	kapacitor -url http://172.1.14.4:9092 show cpu
	kapacitor -url http://172.1.14.4:9092 show mongo_connection
