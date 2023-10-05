FROM node:14
WORKDIR /app
COPY . .
RUN npm install
RUN rm package.json
RUN rm package-lock.json
#VOLUME [ "/app/node_modules" ]
EXPOSE 8080
CMD ["node","app.js"]

