FROM python:3.7-slim-stretch

LABEL Maintainer="andresnator@gmail.com" \
    Name=debian-stretch-slim-python2-docker \
    Version=1.0.0 

RUN apt-get update -qq && apt-get install -y --no-install-recommends \
    ca-certificates \
    python \
    curl \
    apt-transport-https \
    gnupg2 \
    software-properties-common

RUN apt-get install -y -qq python-pip &&\
    pip install PyInquirer &&\
    rm -rf /var/lib/apt/lists/*
    
    
RUN pip install --upgrade   pip \
                            mock \
                            html-testRunner \
                            unittest-xml-reporting \
                            pytest \
                            pytest-cov    


RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - &&\
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" &&\
    apt-get update -qq &&\
    apt-get -y -qq --no-install-recommends install docker-ce   

RUN curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose
