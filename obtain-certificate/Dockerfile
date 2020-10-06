FROM goacme/lego:v4.0.1 as lego

FROM amazon/aws-cli:2.0.48

COPY --from=lego /usr/bin/lego /usr/bin/lego

COPY entrypoint.sh /

ENTRYPOINT ["/usr/bin/bash", "/entrypoint.sh"]
