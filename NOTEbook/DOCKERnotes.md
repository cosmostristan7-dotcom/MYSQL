# Every time I made a change or update to my files, I need to type these commands one by one on the terminal, so the information changed here can be replaced at DOCKER too:

docker rm -f my-cndstudio-site
docker build -t cndstore-server .
docker run -d -p 8080:80 --name my-cndstore-site cndstore-server

