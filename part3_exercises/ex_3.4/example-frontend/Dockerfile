FROM node:16

# Open port 5000
EXPOSE 5000

# Set working directory
WORKDIR /usr/src/app

COPY --chown=appuser:appuser package*.json ./

# Set environment variable
ENV REACT_APP_BACKEND_URL=http://localhost:8080

# copy contents of current directory
RUN npm install --production
COPY . .
RUN npm run build && \
    npm install -g serve && \
    useradd -m appuser && \
    rm -rf /usr/src/app/node_modules
    
USER appuser

CMD [ "serve", "-s", "-l", "5000", "build" ]