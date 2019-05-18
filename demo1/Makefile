REPO:=ccrone/kubecon-eu-19
INVOC_TAG:=demo1-installer

APP_NAME:=demo1

.PHONY: invocation-image
invocation-image:
	docker build --tag $(REPO):$(INVOC_TAG) invocation-image

.PHONY: push-invocation-image
push-invocation-image: invocation-image
	docker push $(REPO):$(INVOC_TAG)

.PHONY: install
install:
	./duffle install $(APP_NAME) bundle.json --bundle-is-file --insecure

.PHONY: uninstall
uninstall:
	./duffle uninstall $(APP_NAME)
