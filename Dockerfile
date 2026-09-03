FROM openclaw/openclaw:latest

USER root

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

USER node

EXPOSE 18789

ENTRYPOINT ["/entrypoint.sh"]
