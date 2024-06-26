GO_VERSION := 1.22


.PHONY: install-go init-go

setup: install-go init-go

build:
	go build -o api cmd/main.go

install-go:
	# Linux
	wget "https://golang.org/dl/go$(GO_VERSION).linux-amd64.tar.gz"
	sudo tar -C /usr/local -xzf go$(GO_VERSION).linux-amd64.tar.gz
	rm go$(GO_VERSION).linux-amd64.tar.gz

	# MacOS (Intel)
	curl -o go$(GO_VERSION).darwin-amd64.tar.gz "https://golang.org/dl/go$(GO_VERSION).darwin-amd64.tar.gz"
	sudo tar -C /usr/local -xzf go$(GO_VERSION).darwin-amd64.tar.gz
	rm go$(GO_VERSION).darwin-amd64.tar.gz

init-go:
	echo 'export PATH=$$PATH:/usr/local/go/bin' >> $${HOME}/.bashrc
	echo 'export PATH=$$PATH:$${HOME}/go/bin' >> $${HOME}/.bashrc
