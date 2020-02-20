BRANCH ?= master
SUBSCRIPTION ?= "jessde"
RG ?= jdk8s-us

.PHONY: local-clean git-clean helm-delete azd-clean

all:
	-make local-clean
	-make git-clean
	# -make helm-delete
	# make azd-clean

local-clean:
	-kubectx docker-for-desktop
	-helm delete --purge spring-boot-websocket-chat-demo
	-rm -rf charts draft.toml Dockerfile .draftignore .dockerignore .draft-tasks.toml docker-compose.yml docker-compose.debug.yml

# delete-branch: 
# 	-git branch -d $(BRANCH)
# 	-git push origin -d $(BRANCH) && echo "$(branch) branch successfully deleted"
# 	-git fetch --prune

git-clean:
	- git commit -am "reset demo"
	- git push

# helm-delete:
# 	-kubectx jdk8s-us
# 	-helm delete --purge chatty-bot
# 	-kubectx docker-for-desktop

# azd-clean:
# 	@scripts/azdo-cleanup.sh
# azd-clean:
# 	@scripts/azdo-cleanup.sh
