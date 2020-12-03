cp gw.lo/install-config.yaml tmp/
value=$(yq r tmp/install-config.yaml pullSecret)
echo ${value} > tmp/pull-secret.json
export REGUSERAUTH=`echo -n 'dummy:dummy' | base64 -w0`
cat tmp/pull-secret.json | jq --arg "localhost": { "auth" "xyzz", "email": "dummy@dummy.com" } 
