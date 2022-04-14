FROM golang:1.16

# Open port 8080
EXPOSE 8080

# Set working directory 
WORKDIR /go/src/app

# Set environment variable
ENV REQUEST_ORIGIN=http://localhost:5000


# Copy current directory
COPY . .


RUN go build

cmd ./server
