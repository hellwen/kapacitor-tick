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

tick-enable:
	kapacitor -url http://172.1.14.4:9092 enable cpu

tick-show:
	kapacitor -url http://172.1.14.4:9092 show cpu
