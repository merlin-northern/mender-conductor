FROM alpine:3.4

RUN apk update && apk add \
    python3 \
    git \
    curl

RUN git clone https://github.com/Netflix/conductor.git && \
    cd conductor/client/python && \
    git checkout v1.8.1

RUN pip3 install conductor/client/python

COPY entrypoint.sh /usr/bin/entrypoint.sh

ENTRYPOINT ["/usr/bin/entrypoint.sh"]
