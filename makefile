
all:
	rm -rf ./vendor
	govendor init
	govendor add +e
	go build

clean:
	rm -rf ./vendor
	rm -f fetch-block
