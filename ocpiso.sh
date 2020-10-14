export REGISTRY_AUTH_HTPASSWD_REALM=RegRealm
export REGISTRY_AUTH=htpasswd
export REGISTRY_AUTH_HTPASSWD_REALM=Registry Realm
export REGISTRY_HTTP_SECRET=RegistrySecret
export REGISTRY_AUTH_HTPASSWD_PATH=/opt/registry/auth/htpasswd
export REGISTRY_HTTP_TLS_CERTIFICATE=/domain.crt
export REGISTRY_HTTP_TLS_KEY=/domain.key
/usr/bin/registry serve registry/config.yml &
echo "Running"
echo "Pulling Release"
curl -s https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/ocp/latest-4.5/release.txt -o release.txt
echo "Pulling Installer"
curl -s https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/ocp/latest-4.5/openshift-install-mac.tar.gz -o install.tar.gz
tar xvzf install.tar.gz
rm install.tar.gz
curl -u dummy:dummy -k https://localhost:5000/v2/_catalog
echo "done"
#while true; do sleep 10000; done
