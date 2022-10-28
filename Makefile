.PHONY: cluster
cluster:
	k3d cluster create --config k3d-config.yaml

.PHONY: delete
delete:
	k3d cluster delete k3s-default

.PHONY: dev
dev:
	skaffold dev -p local

.PHONY: run
run:
	skaffold run -p local