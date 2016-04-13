FROM nginx:1.9.14

ENTRYPOINT ["/bin/start.sh"]
EXPOSE 80
ENV CONSUL_URL consul:8500

RUN rm /etc/nginx/conf.d/default.conf
COPY start.sh /bin/start.sh
RUN chmod +x /bin/start.sh
COPY service.ctmpl /templates/service.ctmpl

ADD https://github.com/hashicorp/consul-template/releases/download/v0.7.0/consul-template_0.7.0_linux_amd64.tar.gz /usr/bin/
RUN tar -C /usr/local/bin --strip-components 1 -zxf /usr/bin/consul-template_0.7.0_linux_amd64.tar.gz

