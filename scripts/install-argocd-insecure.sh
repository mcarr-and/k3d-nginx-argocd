kubectl create namespace argocd


kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml 

# Setup to run insecure via http
# restart the argo and argo-repo-server to allow http to be available
kubectl apply -n argocd -f argocd-cmd-params-cm-insecure.yaml
kubectl rollout restart -n argocd deployment argocd-server
kubectl rollout restart -n argocd deployment argocd-repo-server
