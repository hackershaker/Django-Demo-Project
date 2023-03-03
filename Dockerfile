FROM ubuntu:20.04
WORKDIR /usr/src/demopollapp
# timezone 설정
RUN \
    apt-get update; \
    apt-get install -yq tzdata; \
    ln -fs /usr/share/zoneinfo/Asia/Seoul /etc/localtime;

# install ubuntu tools
RUN \
    apt-get update; \
    apt-get install -y sudo; \
    sudo apt-get install net-tools; \
    sudo apt-get update; \
    sudo apt-get dist-updrade -y; \
    sudo apt-get install gnupg2 wget vim -y; \
    sudo apt-get install -y systemd; \
    apt-get install -y lsb-release

# install python
RUN \
    sudo apt-get -y install software-properties-common; \
    sudo apt update; \
    sudo add-apt-repository ppa:deadsnakes/ppa; \
    sudo apt update;\
    sudo apt -y install python3.11; \
    sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.11 1;

# copy all src files
COPY . .
# install packages
RUN \
    sudo apt-get -y install curl; \
    curl --version;
RUN \
    curl -sS https://bootstrap.pypa.io/get-pip.py | python3.11; \
    python3 -m pip --version; \ 
    python -m pip3 install --upgrade pip; \
    sudo apt-get -y install python3.11-distutils; \
    pip3 install -r requirements.txt;

CMD ./start.sh