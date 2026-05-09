SRCS   = main.go prog.go
TARGET = bootstrap/prog-x64-linux \
         bootstrap/prog-arm64-linux \
         bootstrap/prog-arm64-macos

all: $(TARGET)

format: $(SRCS)
	gofmt -w $^

bootstrap/prog-x64-linux: $(SRCS) | bootstrap
	GOOS=linux GOARCH=amd64 go build -o $@

bootstrap/prog-arm64-linux: $(SRCS) | bootstrap
	GOOS=linux GOARCH=arm64 go build -o $@

bootstrap/prog-arm64-macos: $(SRCS) | bootstrap
	GOOS=darwin GOARCH=arm64 go build -o $@

bootstrap:
	mkdir bootstrap

clean:
	rm -f $(TARGET)

.PHONY: all clean format

