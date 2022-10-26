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
127.0.0.1	localhost argocd.localhost

::1             localhost
