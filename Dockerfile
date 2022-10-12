FROM golang:alpine AS builder

WORKDIR $GOPATH/src/codeeducation

COPY . $GOPATH/src/codeeducation

RUN go build -v -o /codeeducation $GOPATH/src/codeeducation/message.go

# 
# Final stage
#
FROM scratch
 
# Copy only required data into this image
COPY --from=builder /codeeducation .
 
# Start app
ENTRYPOINT [ "/codeeducation" ]