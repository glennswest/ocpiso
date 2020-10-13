#FROM registry.access.redhat.com/ubi7/ubi:latest
FROM registry.access.redhat.com/rhel7:latest
LABEL maintainer Glenn West <gwest@redhat.com>

#RUN curl https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm -o epel-release-latest-7.noarch.rpm
#RUN yum install -y epel-release-latest-7.noarch.rpm
RUN yum-config-manager --enable rhel-7-server-extras-rpms
RUN yum install -y docker-distribution
RUN yum install -y podman
RUN curl -s https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/ocp/latest-4.5/release.txt
RUN curl -s https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/ocp/latest-4.5/openshift-install-mac.tar.gz -o install.tar.gz
RUN tar xvzf install.tar.gz
RUN rm install.tar.gz
RUN mkdir -p ./registry
COPY registry/config.yml ./registry
COPY ocpiso.sh .
ENTRYPOINT "./ocpiso.sh"


