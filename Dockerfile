FROM node:12.2.0-stretch as build
WORKDIR /app

ARG HOST
ARG API_EXEC_HOST
ARG SOCKET_HOST
ARG IMAGE_HOST
ARG ERROR_IMAGE_HOST
ARG DEBUG


ENV HOST ${HOST}
ENV API_EXEC_HOST ${API_EXEC_HOST}
ENV SOCKET_HOST ${SOCKET_HOST}
ENV IMAGE_HOST ${IMAGE_HOST}
ENV ERROR_IMAGE_HOST ${ERROR_IMAGE_HOST}
ENV DEBUG ${DEBUG}

RUN env

COPY ./Portal /app
RUN rm -rf node_modules package-lock.json
RUN npm install

RUN ls
RUN npm run build


FROM strapi/base

RUN mkdir /srv/executor
WORKDIR /srv/executor

COPY ./FlowExecutor .
RUN ls
RUN npm install
RUN npm install -g protractor

RUN mkdir -p /opt/images
WORKDIR /opt
RUN ln -s /opt/images/ p_images

RUN mkdir /srv/api && chown 1000:1000 -R /srv/api
WORKDIR /srv/api
VOLUME /srv/api

COPY ./APIService/docker-entrypoint.sh /usr/local/bin/
RUN ["chmod", "+x", "/usr/local/bin/docker-entrypoint.sh"]


# Portal
RUN \
    apt-get update && \
    apt-get install -y nginx && \
    rm -rf /var/lib/apt/lists/* && \
    echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
    chown -R www-data:www-data /var/lib/nginx

COPY --from=build /app/dist /usr/share/nginx/html/dist
COPY ./nginx.conf /etc/nginx/sites-enabled/default

ENV NODE_ENV production

EXPOSE 80
EXPOSE 443
EXPOSE 1337

ENTRYPOINT [ "docker-entrypoint.sh" ]

CMD ["startup.sh"]