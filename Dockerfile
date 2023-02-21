FROM ubuntu:20.04
WORKDIR /usr/src/demopollapp
# timezone 설정
RUN \
    apt-get update; \
    apt-get install -yq tzdata; \
    ln -fs /usr/share/zoneinfo/Asia/Seoul /etc/localtime;

# install postgresql
RUN \
    apt-get update; \
    apt-get install -y sudo; \
    sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'; \
    \
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -; \
    \
    sudo apt-get update; \
    \
    sudo apt-get -y install postgresql

# install python
RUN \
    sudo apt-get -y install software-properties-common; \
    sudo apt update; \
    sudo add-apt-repository ppa:deadsnakes/ppa; \
    sudo apt update;\
    sudo apt -y install python3.11; \
    sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.11 1;

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

# copy all src files

CMD [ "python3", "manage.py", "runserver" ]