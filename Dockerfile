FROM debian:latest

WORKDIR /root

COPY . ./dotfiles

RUN ./dotfiles/install.sh -d

EXPOSE 22

CMD ["/sbin/init"]
