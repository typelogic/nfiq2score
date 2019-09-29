# fingerprint score server
# steps
- git clone https://github.com/typelogic.com/nfiq2score.git
- cd nfiq2store/
- Docker build -t nfiq2image .

# Usage
- Create the image (https://asciinema.org/a/oQtQj7ZSHHjU8vrG08RX89edy)
- Run a container from the image
- Enter into the container and run `/root/nfiq2.py /root/samples/0000994.png`
