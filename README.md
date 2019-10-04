# fingerprint score server
# steps
- git clone https://github.com/typelogic.com/nfiq2score.git
- cd nfiq2store/
- Docker build -t nfiq2image .

# Usage
- Create the image (https://asciinema.org/a/oQtQj7ZSHHjU8vrG08RX89edy)
- Run a container from the image (https://asciinema.org/a/KDbjVrfSCx5JB0vo2DlJvERHS)
- Enter into the container and run `/root/nfiq2.py /root/samples/0000994.png`

# REST API
Instantiate a container from the image:
`docker run --name=restnfiq2 -d --rm nfiq2image2`

Get the ip address of the container:
`docker inspect restnfiq2 | grep -i ipaddr`

Send a PUT request to the container's API:
`curl -s -X PUT 172.17.0.2:8000/upload --upload-file samples/0000998.png`

To propagate the REST outside of the host, then
`docker run --name=restnfiq2 -d -p 80:8000 --rm nfiq2image2`

Send PUT request to your host ip address:
`curl -s -X PUT 192.168.1.2:8000/upload --upload-file samples/0000998.png`

The `EXPOSE` directive inside Dockerfile allows port mapping propagation from 
container to host. The `-p 80:8000` associates the container's 8000 to the 
host machine's 80. Port 80 open-up is made possible even if user is non-root, 
because the `docker` command is merely a client sending a message to the docker 
daemon already running as root. If `-P` is specified, than the host port is 
randomly choosen to map to the container's 8000.
