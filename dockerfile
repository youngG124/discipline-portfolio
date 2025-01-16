# Step 1: Use official Nginx image as base
FROM nginx:alpine

# Step 2: Copy the dist directory into the container
COPY dist/ /usr/share/nginx/html

# Step 3: Expose port 80 (default for Nginx)
EXPOSE 80

# Step 4: Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]