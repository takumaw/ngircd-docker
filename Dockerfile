FROM debian:stretch

RUN set -ex \
	&& apt-get update -y && apt-get install -y --no-install-recommends \
		ngircd \
	&& rm -rf /var/lib/apt/lists/*

EXPOSE 194 994 6660-6669 6679 6697
VOLUME ["/etc/ngircd", "/var/run/ircd"]

USER irc
ENTRYPOINT ["ngircd"]
CMD ["--nodaemon"]
