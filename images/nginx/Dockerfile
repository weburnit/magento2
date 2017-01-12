FROM nginx
COPY nginx.conf /etc/nginx/nginx.conf

ADD bundle.crt /etc/nginx/bundle.crt
ADD apps.key /etc/nginx/apps.key
ADD apps.conf /etc/nginx/conf.d/app.conf
ADD apps-static.conf /etc/nginx/conf.d/app-static.conf
ADD apps-ssl.conf /etc/nginx/conf.d/app-ssl.conf
ADD dev.conf /etc/nginx/conf.d/dev.conf
