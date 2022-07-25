FROM golang:1.18 AS builder

WORKDIR /usr/src/app

# pre-copy/cache go.mod for pre-downloading dependencies and only redownloading them in subsequent builds if they change

COPY ./main .
RUN go build code-education-rocks.go

FROM scratch

WORKDIR /usr/src/app
COPY --from=builder ./usr/src/app/code-education-rocks .

CMD ["./code-education-rocks"]