git: push

add:
	git add .

commit: add
	git commit -am "ok"

push: commit
	git push origin master

tick: tick-define tick-enable tick-show

tick-define:
	kapacitor -url http://139.199.73.164:32011 define k8s-cpu -type stream -tick k8s-cpu.tick -dbrp k8s.default
	kapacitor -url http://139.199.73.164:32011 define k8s-memory -type stream -tick k8s-memory.tick -dbrp k8s.default

tick-enable:
	kapacitor -url http://139.199.73.164:32011 enable k8s-cpu
	kapacitor -url http://139.199.73.164:32011 enable k8s-memory

tick-show:
	kapacitor -url http://139.199.73.164:32011 show k8s-cpu
	kapacitor -url http://139.199.73.164:32011 show k8s-memory
