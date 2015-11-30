FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive

RUN addgroup no-root && \
    adduser \
      --system \
      --ingroup no-root \
      --disabled-login \
      no-root

RUN mkdir /var/nfs-test

USER no-root
VOLUME ["/var/nfs-test"]
ADD nfs-test.sh /
RUN chmod u+x /nfs-test.sh
ENTRYPOINT ["/nfs-test.sh"]
