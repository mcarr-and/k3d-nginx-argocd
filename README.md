Running Argocd in a K3D Kubernetes Cluster with Nginx as the router



## /etc/hosts changes

add the `argocd.local` entry so you have a url to hit inside the K3D cluster. 

```
##
# Host Database
#
# localhost is used to configure the loopback interface
# when the system is booting.  Do not change this entry.
##
255.255.255.255	broadcasthost
127.0.0.1	localhost argocd.local

::1             localhost

```


# Install Cluster and Tools

```bash
./install-all.sh
```

**Note**
This ingress is for HTTP only. 

No HTTPS configuration

#### Configuration starting point. 

https://argo-cd.readthedocs.io/en/stable/operator-manual/ingress/#option-2-multiple-ingress-objects-and-hosts 


**Configuration Changes** 

1. Do not redirect for SSL

```yaml
nginx.ingress.kubernetes.io/force-ssl-redirect: "false"
```

# Test to see if Argocd is running


## Curl command 
```bash
curl -v -k http://argocd.local:8070 -H "host: argocd.local:8070" --resolve argocd.local:8070:127.0.0.1
```

### Curl expected output
```
<!doctype html><html lang="en"><head><meta charset="UTF-8"><title>Argo CD</title>
......
```

## Browser test.

**?** is an important part of the URL. If you do not have a **?** on your URL Chrome 


[http://argocd.local:8070?](http://argocd.local:8070?)

This should forard you onto 

[http://argocd.local:8070/login?](http://argocd.local:8070/login?)


### Get Argocd Admin Password

```bash
./scripts/argocd-show-password.sh
```


# tear down cluster

```bash
./scripts/cluster-delete.sh
```