FROM rodrigotsuru/db2-docker:10.5
MAINTAINER Rodrigo Tsuru "caixapostal@gmail.com"
RUN yum install -y curl
RUN cd /tmp && \
USER db2inst1
COPY ./ /tmp
RUN ./configureDb2.sh && \
RUN 
