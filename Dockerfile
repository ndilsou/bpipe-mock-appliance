FROM nginx:alpine

COPY nginx.conf /etc/nginx/nginx.conf
COPY stream.template.conf /etc/nginx/templates/stream.template