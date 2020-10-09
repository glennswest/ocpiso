cp ../gw.lo/install-config.yaml tmp/
value=$(yq r tmp/install-config.yaml pullSecret)
echo ${value}

