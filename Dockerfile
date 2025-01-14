# Use an official Nginx image from the Docker Hub
FROM nginx:alpine

# Copy the HTML file into the default Nginx directory
COPY ./index.html /usr/share/nginx/html/index.html
