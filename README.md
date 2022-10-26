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
```
##
# Host Database
#
# localhost is used to configure the loopback interface
# when the system is booting.  Do not change this entry.
##
255.255.255.255	broadcasthost
127.0.0.1	localhost argocd.localhost

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
curl -v -k http://argocd.localhost:8070 -H "host: argocd.localhost:8070" --resolve argocd.localhost:8070:127.0.0.1
```

### Curl expected output
```
<!doctype html><html lang="en"><head><meta charset="UTF-8"><title>Argo CD</title>
......
```

## Browser test.

[http://argocd.localhost:8070?](http://argocd.localhost:8070?)

**NOTE: URL and the need for the *?* on the end of the url**

Should forward you to : 

[http://argocd.localhost:8070/login?](http://argocd.localhost:8070/login?)


## Chrome HTTPS forward Issue 

### Versions used in test
* Chrome version 
    * 107.0.5304.62 
* Nginx 
    * 1.23.2
* K3D 
  * 5.4.6


There is a bug in Chrome Mac where: 

[http://argocd.localhost:8070?](http://argocd.localhost:8070?)

Will forward you to: 

https://argocd.localhost 


**Mac Chrome URL Problems**
1. stripping off the port number on the URL
1. Forwards to **https** even when asking for http


### Browsers that do work with this setup

 * Safari 
    * 16.0 

Does not forward to https by default. 


# tear down cluster

```bash
./scripts/cluster-delete.sh
```