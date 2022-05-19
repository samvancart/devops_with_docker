FROM golang:1.16 AS build
WORKDIR /go/src/app
ENV REQUEST_ORIGIN=http://localhost:5000
COPY . .
RUN useradd -m appuser && \
    CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build \
    -ldflags="-w -s" -o /myapp 

FROM scratch
WORKDIR /go/src/app
COPY --from=build /myapp /myapp
COPY --from=build /etc/passwd /etc/passwd
EXPOSE 8080
USER appuser
ENTRYPOINT ["/myapp"]
