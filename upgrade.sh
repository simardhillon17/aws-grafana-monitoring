#
# This is a super-temporary solution to automate installation of Grafana
# until ArgoCD is ready and working.
#

# Copy the grpc-secret key provided by Platform from the default workspace to the
# monitoring workspace.
kubectl delete secret/grafana-tls-secret || true
kubectl get secret/approved-cert -n default -o yaml | sed 's/approved-cert/grafana-tls-secret/g' | sed 's/default/monitoring/g' | kubectl apply -f -

# Install Grafana Operator with Helm
cd src
rm -rf charts
helm dependency update
helm upgrade grafana . -f deploy/values-override.yaml -n monitoring
cd ..

# Smoketest
echo
echo "Run 'watch ./deploy-test.sh' to ensure this is all deployed correctly"
