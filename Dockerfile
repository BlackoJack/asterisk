FROM alpine:edge
MAINTAINER Raenko Ivan <admin@sysadminsk.ru>

ENV LANG ru_RU.utf8
ENV LC_ALL ru_RU.utf8
ENV LANGUAGE ru_RU.utf8
ENV TZ Asia/Novosibirsk


COPY scripts/ /
RUN /install.sh

ENTRYPOINT ["/start.sh"]
CMD ["/usr/sbin/asterisk", "-vvvdddf", "-T", "-W", "-U", "root", "-p"]
