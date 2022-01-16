deploy:
	git push origin
	ssh root@salt -e salt-run -l debug fileserver.update
