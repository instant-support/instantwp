FROM golang:1.24-alpine AS builder
RUN apk add --no-cache git make
WORKDIR /app
COPY . .
RUN go mod download
RUN RUN go build -o instantwp ./cmd/Instantwp

FROM alpine:latest
RUN apk add --no-cache ca-certificates
WORKDIR /root/
COPY --from=builder /app/instantwp .
COPY --from=builder /app/config.example.toml ./config.toml
EXPOSE 8080
# Database connection force karne ke liye env set kar rahe hain
ENV DATABASE_URL=postgres://instantwp:password123@db:5432/instantwp?sslmode=disable
CMD ["./instantwp", "server", "-migrate"]