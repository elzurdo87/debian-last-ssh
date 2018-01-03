# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
FROM debian:latest


#ENV http_proxy http://user:Pass@server:port/
#ENV https_proxy http://user:Pass@server:port/


run apt-get update

run apt-get install -y apt-utils

run apt-get update
run apt-get install -y openssh-server wget apt-transport-https lsb-release ca-certificates build-essential unzip libaio1 vim

RUN echo 'root:root' |chpasswd
RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

RUN mkdir -p /var/run/sshd

EXPOSE 22 80

CMD    ["/usr/sbin/sshd", "-D"]
