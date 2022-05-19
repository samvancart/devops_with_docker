FROM node:16 as builder

# Set working directory
WORKDIR /usr/src/app

COPY --chown=appuser:appuser package*.json ./

# Set environment variable
ENV REACT_APP_BACKEND_URL=http://localhost:8080

# copy contents of current directory
RUN npm install --production
COPY . .
RUN npm run build
    


FROM node:16-alpine
WORKDIR /usr/src/app
COPY --from=builder /usr/src/app ./
# Open port 5000
EXPOSE 5000
RUN npm install -g serve && \
    adduser -S appuser
USER appuser
CMD [ "serve", "-s", "-l", "5000", "build" ]