FROM ubuntu:18.04
EXPOSE 5000
WORKDIR /usr/src/app

RUN apt-get update && apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash
RUN apt install -y nodejs

# copy contents of current directory
COPY . .
RUN npm install
RUN npm run build
RUN npm install -g serve

CMD serve -s -l 5000 build