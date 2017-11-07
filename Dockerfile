FROM alpine
RUN apk add --no-cache asterisk
ENTRYPOINT ["bash"]
