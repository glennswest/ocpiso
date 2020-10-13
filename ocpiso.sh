/usr/bin/registry serve registry/config.yml
echo "Running"
echo "Pulling Release"
RUN curl -s https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/ocp/latest-4.5/release.txt
echo "Pulling Installer"
RUN curl -s https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/ocp/latest-4.5/openshift-install-mac.tar.gz -o install.tar.gz
RUN tar xvzf install.tar.gz
RUN rm install.tar.gz
echo "done"
while true; do sleep 10000; done
