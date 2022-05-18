FROM golang:1.16-alpine

# Open port 8080
EXPOSE 8080

# Set working directory 
WORKDIR /go/src/app

# Set environment variable
ENV REQUEST_ORIGIN=http://localhost:5000

# Copy current directory
COPY . .

RUN adduser -S appuser && \
    chown -R appuser: /go/src/app && \
    go build

USER appuser

cmd ./server
