

# Some sanity checks and smoke tests

helm ls | grep -q grafan && echo Good: Grafana Installed || echo Problem: Grafana Has NOT been installed

kubectl get pods  -n monitoring  | grep "grafana.*Running" | wc -l | grep -q 4 && echo "Good: 4 pods are running" || echo "Problem: Check running pods"

kubectl get services  -n monitoring  | grep "grafana" | wc -l | grep -q 3 && echo "Good: 2 services are up" || echo "Problem: Check running services"
