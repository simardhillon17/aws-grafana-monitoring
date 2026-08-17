#
# This is a super-temporary solution to automate installation of Grafana
# until ArgoCD is ready and working.
#

helm uninstall grafana -n monitoring || true
#kubectl delete crds/grafanas.integreatly.org
#kubectl delete crds/grafanadatasources.integreatly.org
#kubectl delete crds/grafanadashboards.integreatly.org

# Make sure the namespace is there.
kubectl create namespace monitoring --dry-run=client -o yaml | kubectl apply -f -

# Copy the grpc-secret key provided by Platform from the default workspace to the
# monitoring workspace.
# Important! : The aproved-secret key doesn't work for internal K8S naming conventions.
kubectl delete secret/grafana-tls-secret || true
kubectl get secret/approved-cert -n default -o yaml | sed 's/approved-cert/grafana-tls-secret/g' | sed 's/default/monitoring/g' | kubectl apply -f -

# Install Grafana Operator with Helm
cd src
rm -rf charts
helm dependency update
helm install grafana . -f deploy/values-override.yaml -n monitoring
cd ..

# Smoketest.  Not really needed if ArgoCD is used.
echo
echo "Run 'watch ./deploy-test.sh' to ensure this is all deployed correctly"
