build:
	docker build --tag bryandollery/pawst .

run:
	docker run -it -d -v /var/run/docker.sock:/var/run/docker.sock -v $$(pwd):/work -v $$HOME:/host -v aws:/root/.aws -v /mnt/c/Users/bryan:/bryan --name pawst bryandollery/pawst

bash:
	docker exec -it pawst bash

kill:
	docker rm -f pawst

stop: kill
