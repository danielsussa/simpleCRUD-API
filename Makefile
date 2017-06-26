CMD_APISERVER=github.com/danielsussa/simpleCRUD/backend

build:
	echo "up to date!"
	go get -v -d ${CMD_APISERVER}
	CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o build/simpleCRUD ${CMD_APISERVER}
	docker build -t simple-crud -f Dockerfile .

docker:
	docker build -t simple-crud -f Dockerfile .

remove:
	docker rmi simple-crud -f

stop:
	docker ps -q --filter ancestor="simple-crud" | xargs -r docker stop

run:
	echo "Running APP!"
	for x in ./build/simpleCRUD ; do (curl localhost:8081/person) ; done

