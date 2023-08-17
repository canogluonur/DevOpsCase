# DevOpsCase

Sock-Shop on K3s

First of all, we open 3 ec2 ​​instances from amazon.

Then Clone the this repo

```
$ git clone https://github.com/canogluonur/DevOpsCase.git
$ cd DevOpsCase
```

Deploy Sock Shop

```
$ kubectl create -f deploy/kubernetes/manifests/sock-shop.yaml
```

To start Jaeger run the following command after deploying the sock shop

```
$ kubectl apply -f deploy/kubernetes/jaeger
```
Wait for all the Sock Shop services to start

```
$ kubectl get pods -n sock-shop
```

Check the Sock Shop webpage
Once the application is deployed, navigate to http://<your-cluster-ip>:30001 to see the Sock Shop home page.



Opentracing

Jaeger is part of the deployment and has been written into some of the services. While the system is up you can view the traces in Jaeger at http://<your-cluster-ip>:<jaeger-nodePort> . Currently orders provide the most comprehensive traces, but this requires a user to place an order.

### You can check the photo on /photo directory



### Load-Test

```
$ docker run --rm weaveworksdemos/load-test -d 5 -h <your-cluster-ip>:30001 -c 2 -r 100
```


### Monitoring

```
$ kubectl create -f ./deploy/kubernetes/monitoring
```

Prometheus:

```
$ kubectl get svc prometheus/monitoring -n monitoring
```


