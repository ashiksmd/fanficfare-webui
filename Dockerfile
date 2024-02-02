FROM golang:alpine

RUN apk add --update py-pip git

ENV PYTHONUNBUFFERED 1
RUN python3 -m venv /opt/venv
# Enable venv
ENV PATH="/opt/venv/bin:$PATH"

RUN pip3 install FanFicFare --upgrade

WORKDIR /fanficfare

RUN go mod init fanficfare
RUN go get -d -v github.com/labstack/echo/v4 github.com/labstack/echo/v4/middleware github.com/microcosm-cc/bluemonday

COPY . /fanficfare

RUN go build server.go

EXPOSE 80

CMD ["./server"]f
