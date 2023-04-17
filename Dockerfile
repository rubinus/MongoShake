#FROM golang:alpine3.12 as golang
#RUN apk add bash make git zip tzdata ca-certificates gcc musl-dev
#WORKDIR /app
#COPY . .
#RUN make linux

FROM rubinus/ansible-check-k8s:latest
# Dependencies
#RUN apk --no-cache add tzdata ca-certificates musl
RUN yum install -y tzdata ca-certificates musl
RUN python -m pip install pymongo
WORKDIR /app
COPY bin/mongoshake-stat /usr/bin/
COPY bin/collector.linux /app/
COPY bin/comparison.py /app/
COPY run.md /app/
COPY ./conf /app/
RUN ls -la /app/
# metrics
EXPOSE 9100
EXPOSE 9200
ENTRYPOINT ["/app/collector.linux"]