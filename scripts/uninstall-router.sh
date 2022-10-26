kubectl delete -f ingress-argocd-nginx.yaml
helm uninstall -n kube-system nginx-ingress 