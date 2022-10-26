helm repo add nginx-stable https://helm.nginx.com/stable
helm repo update
helm install nginx-ingress nginx-stable/nginx-ingress

kubectl apply -f ingress-argocd-nginx.yaml