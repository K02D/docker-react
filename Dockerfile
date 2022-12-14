FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Need nginx because there's no dev server in production
FROM nginx
# Need to expose port 80 for AWS Elastic Beanstalk
EXPOSE 80
# Copy the build folder from the 'builder' phase to nginx; everything else in the 'builder' phase is discarded
COPY --from=builder /app/build /usr/share/nginx/html
