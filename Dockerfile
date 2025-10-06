FROM golang:1.24.2
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY *.go *.db ./
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /parcel_app
CMD ["/parcel_app"]