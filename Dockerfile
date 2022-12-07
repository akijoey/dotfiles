FROM debian:latest

WORKDIR /root

COPY . ./dotfiles

RUN apt update && apt install -y curl

RUN sh -c "$(curl -fsSL https://github.com/akijoey/dotfiles/raw/main/install.sh)"

EXPOSE 22

CMD ["zsh"]
