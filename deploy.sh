docker build -t sterelus/multi-client:latest -t sterelus/multi-client:$SHA -f ./complex/client/Dockerfile ./complex/client
docker build -t sterelus/multi-server:latest -t sterelus/multi-server:$SHA -f ./complex/server/Dockerfile ./complex/server
docker build -t sterelus/multi-worker:latest -t sterelus/multi-worker:$SHA -f ./complex/worker/Dockerfile ./complex/worker

docker push sterelus/multi-client:$SHA
docker push sterelus/multi-server:$SHA
docker push sterelus/multi-worker:$SHA

kubectl apply -f ./complex/k8s

kubectl set image deployments/server-deployment server=sterelus/multi-server:$SHA
kubectl set image deployments/client-deployment server=sterelus/multi-client:$SHA
kubectl set image deployments/worker-deployment server=sterelus/multi-worker:$SHA