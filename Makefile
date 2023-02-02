.PHONY: build clean deploy

build:
	env GOARCH=amd64 GOOS=linux go build -ldflags="-s -w" -o bin/fetch-users fetch-users/main.go
	env GOARCH=amd64 GOOS=linux go build -ldflags="-s -w" -o bin/create-user create-user/main.go

clean:
	rm -rf ./bin

deploy: clean build
	sls deploy --verbose
