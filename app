server {
    listen 80;
    server_name your_domain_or_ip;

    location / {
        proxy_pass http://127.0.0.1:5000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }

    # location /static {
    #     alias /path/to/your/flask/app/static;
    # }

    # location /media {
    #     alias /path/to/your/flask/app/media;
    # }

    # error_page 500 502 503 504 /50x.html;
    # location = /50x.html {
    #     root /usr/share/nginx/html;
    # }
}