FROM rodrigotsuru/db2-docker:10.5
MAINTAINER Rodrigo Tsuru "caixapostal@gmail.com"
RUN yum install -y curl
COPY ./ /tmp
RUN cd /tmp && \
chmod 777 /tmp/* 
USER db2inst1
RUNP cd /tmp && \
source /home/db2inst1/sqllib/db2profile && \
./configureDb2.sh && \
./createDb.sh
