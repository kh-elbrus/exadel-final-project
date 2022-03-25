FROM nginx

RUN mkdir /etc/nginx/ssl
RUN chmod 700 /etc/nginx/ssl
COPY ./ssl/wagtail.crt /etc/nginx/ssl/wagtail.crt
COPY ./ssl/wagtail.key /etc/nginx/ssl/wagtail.key

RUN rm /etc/nginx/nginx.conf
ADD ./config/nginx.conf /etc/nginx/nginx.conf

ADD ./config/wagtail.conf /etc/nginx/conf.d/wagtail.conf
