.DEFAULT_GOAL := build

fmt:
	go fmt ./...
.PHONY:fmt

lint: fmt
	staticcheck ./...
.PHONY:lint

vet: lint
	go vet ./...
.PHONY:vet

build: vet
	go build cmd/main.go
.PHONY:build

run: vet
	go run cmd/main.go
.PHONY:run

test: vet
	go test ./...
.PHONY:test
