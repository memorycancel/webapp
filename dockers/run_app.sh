rm tmp/pids/server.pid

docker run -d \
	--name app \
	-p 3000:3000 \
	-v /Users/memorycancel/Desktop/work/codes/Ruby/webapp:/usr/src/app \
	recost