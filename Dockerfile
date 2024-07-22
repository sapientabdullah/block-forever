FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    iptables \
    sudo \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - \
    && apt-get install -y nodejs

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

RUN chmod +x /usr/src/app/bin/block-website.sh

RUN chmod +x /usr/src/app/scripts/monitor-firewall.sh

EXPOSE 3000

CMD ["sh", "-c", "nohup /usr/src/app/scripts/monitor-firewall.sh &"]

ENTRYPOINT ["node", "index.js"]