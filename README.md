# Quickstart

1) Create Cluster
    ```bash
    make cluster
    ```

2) Deploy nginx, argo and dashbaord
    ```bash
    make run
    ``` 

3) vist argo
    ```http://argocd.localhost:8080/```

## /etc/hosts

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

### 1. Install D3d and disable the internal Traefik that is used by defalt

```bash
./scripts/cluster-create.sh
```

### 2. Install Argocd with insecure configuration to allow HTTP

```bash
./scripts/install-argocd-insecure.sh
```

### 3. Install Nginx

```bash
./scripts/install-nginx.sh
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

2. Comment out the TLS as Nginx was not respecting this secret

```yaml
#tls:
#  - hosts:
#    - argocd.example.com
#    secretName: argocd-secret # do not change, this is provided by Argo CD
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

http://argocd.local:8070

This should forard you onto 

http://argocd.local:8070/login?


# tear down cluster

```bash
./scripts/cluster-delete.sh
```