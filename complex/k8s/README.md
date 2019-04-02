About ingress-nginx 

-Ingress nginx is essentially an ingress controller + nginx pod(s)
-You hit nginx directly when making requests

On Google Cloud:
-Ingress nginx fronted by a k8s load balancer service
-The load balancer exposes the controller to the outside world, whereas the controller routes requests to the appropriate pods
-The ingress controller is similar to deployments (which are subtypes of controllers) in that it monitors for config changes and acts on them
-You hit the Google Cloud load balancer, which hits the load balancer service, which hits nginx