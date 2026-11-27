SRCS   = main.go prog.go
TARGET = bootstrap/prog-x86_64-Linux \
         bootstrap/prog-arm64-Linux \
         bootstrap/prog-arm64-Darwin

all: $(TARGET)

format: $(SRCS)
	gofmt -w $^

bootstrap/prog-x86_64-Linux: $(SRCS) | bootstrap
	GOOS=linux GOARCH=amd64 go build -o $@

bootstrap/prog-arm64-Linux: $(SRCS) | bootstrap
	GOOS=linux GOARCH=arm64 go build -o $@

bootstrap/prog-arm64-Darwin: $(SRCS) | bootstrap
	GOOS=darwin GOARCH=arm64 go build -o $@

bootstrap:
	mkdir bootstrap

clean:
	rm -f $(TARGET)

.PHONY: all clean format

