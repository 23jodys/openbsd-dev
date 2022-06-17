update-salt:
	git push origin
	ssh root@salt "salt-run -l debug fileserver.update"

deploy-%: update-salt
	ssh root@$* "salt-call -l info state.apply"
