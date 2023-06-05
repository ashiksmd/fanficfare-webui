FROM golang:alpine

WORKDIR /fanficfare

RUN apk add --update py-pip git

RUN pip3 install FanFicFare --upgrade

RUN go mod init fanficfare
RUN go get -d -v github.com/labstack/echo/v4 github.com/labstack/echo/v4/middleware github.com/microcosm-cc/bluemonday

COPY . /fanficfare

RUN go build server.go

EXPOSE 80

CMD ["./server"]f
