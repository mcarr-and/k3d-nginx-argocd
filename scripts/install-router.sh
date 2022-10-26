helm repo add nginx-stable https://helm.nginx.com/stable
helm repo update
helm install -n kube-system nginx-ingress nginx-stable/nginx-ingress

kubectl create namespace argocd

kubectl apply -f ingress-argocd-nginx.yaml