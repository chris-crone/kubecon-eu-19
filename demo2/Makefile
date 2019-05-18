REPO:=ccrone/kubecon-eu-19
INVOC_TAG:=demo2-installer

APP_NAME:=faas
CNAB_SHA:=6e95e0de663f40f89ad4cefa8954051b6f1c0abda492806e1f7b4ed2635f0508

.PHONY: invocation-image
invocation-image:
	docker build --tag $(REPO):$(INVOC_TAG) invocation-image

.PHONY: push-invocation-image
push-invocation-image: invocation-image
	docker push $(REPO):$(INVOC_TAG)

.PHONY: install
install:
	./docker-app install --credential basic-auth-user=admin --credential basic-auth-password=password --name $(APP_NAME) bundle.json

.PHONY: test
test:
	curl localhost:8080/function/echo-py --data-binary 'Hello KubeCon EU'

.PHONY: uninstall
uninstall:
	./docker-app uninstall --credential basic-auth-user=admin --credential basic-auth-password=password $(APP_NAME) --force

.PHONY: push-cnab
push-cnab:
	./cnab-to-oci push --allow-fallbacks --component-platforms=linux/amd64 --target $(REPO) bundle.json

.PHONY: print-bundle
print-bundle:
	./cnab-to-oci pull $(REPO)@sha256:$(CNAB_SHA) -o -

.PHONY: install-registry
install-registry:
	./docker-app install --credential basic-auth-user=admin --credential basic-auth-password=password --set image-map=true --name $(APP_NAME) $(REPO)@sha256:$(CNAB_SHA)
