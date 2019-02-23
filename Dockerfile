# FOR BUILDING
FROM node:alpine as builder
# 'as' is a reference, everything done here can be refered to as builder
WORKDIR /app
COPY ./package.json .
RUN npm install
COPY . .
CMD ["npm", "run", "build"]

# FOR RUNNING
FROM nginx
# we can now reference builder, and the build folder created by it
COPY --from=builder /app/build /usr/share/nginx/html
# the last part of the copy tag is specific to nginx and where it lives
