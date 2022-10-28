# Quickstart

## 0. Prerequisite - make /etc/hosts changes 

### 0.1 install skaffold

```bash
brew install skaffold
```

### 0.2 /etc/hosts changes

Add the `argocd.localhost` entry so you have a url to hit inside the K3D cluster. 

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

## 1. Create Cluster

    ```bash
    make cluster
    ```

## 2. Deploy nginx, argo and dashbaord

    ```bash
    make run
    ``` 

## 3. Verify argocd is expsed via curl

```bash
 curl -v -k http://argocd.local:8070 -H "host: argocd.local:8070" --resolve argocd.local:8070:127.0.0.1
 ```

## 4. Visit argo

[http://argocd.local:8070?](http://argocd.local:8070?)


### (Optional) Visit Kubernetes Dashboard

[http://k-dashboard.local8070?](http://k-dashboard.local8070?)
