FROM metamagic/ubuntu
#RUN groupadd -r mongodb && useradd -r -g mongodb mongodb
RUN apt-get -y install apt-transport-https ca-certificates

RUN wget -qO - https://www.mongodb.org/static/pgp/server-4.0.asc | apt-key add -
RUN echo 'deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.0 multiverse' > /etc/apt/sources.list.d/mongodb-org-4.0.list
RUN apt-get update && apt-get install -y mongodb-org
RUN mkdir -p /data/db
RUN chown -R mongodb:mongodb /data/db
ADD mongodb.conf /etc/mongodb.conf
VOLUME ["/data/db"]
EXPOSE 27017

CMD ["mongod"]
