FROM nginx

COPY wrapper.sh /

COPY html /usr/share/nginx/html

CMD ["bash ","./wrapper.sh"]
