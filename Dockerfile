FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# We need nginx because there's no dev server in production
FROM nginx 
# Copy the build folder from the 'builder' phase to nginx; everything else in the 'builder' phase is discarded
COPY --from=builder /app/build /usr/share/nginx/html
