

## /etc/hosts
```
127.0.0.1	localhost argocd.localhost 
```


## install 

### 1. Install D3d and disable the internal Traefik that is used by defalt

```bash
./scripts/cluster-create.sh
```

### 2. Install argocd

```bash
./scripts/install-argocd-insecure.sh
```

### 3. Install Nginx

```bash
./scripts/install-nginx.sh
```



## Check if running 


### Curl command 
```bash
curl -v -k http://argocd.localhost:8070 -H "host: argocd.localhost:8070" --resolve argocd.localhost:8070:127.0.0.1
```

#### Curl expected output
```
<!doctype html><html lang="en"><head><meta charset="UTF-8"><title>Argo CD</title>
......
```

### Browser test.

http://argocd.localhost:8070?

####  URL and the need for the **?** on the end of the url

For some reason Chrome on Mac will redirect to: 

https://argocd.localhost 

#### Problems 
1. stripping off the ports 
1. Forwards to **https** even when asking for http


## 4. tear down cluster

```bash
./scripts/cluster-delete.sh
```