FROM alpine:3.11.3
MAINTAINER Ruinscraft

RUN apk add --update --no-cache openssh-client

CMD rm -rf /root/.ssh && mkdir /root/.ssh && cp -R /root/ssh/* /root/.ssh/ && chmod -R 600 /root/.ssh/* && \
ssh \
-vv \
-o StrictHostKeyChecking=no \
-N $TUNNEL_HOST \
-L *:$LOCAL_PORT:$REMOTE_HOST:$REMOTE_PORT \
&& while true; do sleep 30; done;
EXPOSE 1-65535
