FROM registry.access.redhat.com/rhel7:latest
LABEL maintainer Glenn West <gwest@redhat.com>

RUN yum-config-manager --enable rhel-7-server-extras-rpms
RUN yum install -y podman httpd httpd-tools openssl docker-distribution
RUN mkdir -p ./registry
RUN mkdir -p /opt/registry/{auth,certs,data}
RUN cd /opt/registry/certs
RUN openssl req -newkey rsa:4096 -nodes -subj "/C=US/ST=Tennessee/L=Cookeville/O=Global Security/OU=IT Department/CN=local.com" -sha256 -keyout domain.key -x509 -days 365 -out domain.crt
RUN ls /opt/registry/certs
RUN htpasswd -bBc /opt/registry/auth/htpasswd dummy dummy
COPY registry/config.yml ./registry
COPY ocpiso.sh .
ENTRYPOINT "./ocpiso.sh"


