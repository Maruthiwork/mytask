FROM nginx:latest

# ❌ Remove default nginx config
RUN rm /etc/nginx/conf.d/default.conf

# ✅ Copy custom nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

# ✅ Copy custom html
COPY index.html /usr/share/nginx/html/index.html

EXPOSE 80
