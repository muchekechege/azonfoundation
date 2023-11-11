FROM nginx:1.25.2

# remove default file
RUN rm /etc/nginx/conf.d/default.conf

# copy docker config file
COPY nginx.conf /etc/nginx/conf.d/default.conf

# navigate to html static assets
WORKDIR /usr/share/nginx/html

# Remove default nginx static assets
RUN rm -rf ./*
# copy content of public folder
COPY ./public/. .

# Containers run nginx with global directives and daemon off
ENTRYPOINT ["nginx", "-g", "daemon off;"]