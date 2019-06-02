FROM golang:alpine AS builder
COPY . /work
WORKDIR /work
RUN go build -o hello main.go


FROM busybox
COPY --from=builder /work/hello /usr/local/bin/hello
ENTRYPOINT ["/usr/local/bin/hello"]

