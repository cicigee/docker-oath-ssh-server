FROM ubuntu:latest
RUN apt-get update && apt-get -y install openssh-server caca-utils libpam-oath python qrencode file git
RUN cd /root && git clone https://github.com/mcepl/gen-oath-safe.git && /root/gen-oath-safe/gen-oath-safe root@local totp > /root/myresult && mkdir /etc/liboath && tail -1 /root/myresult > /etc/liboath/users.oath && echo 'auth sufficient pam_oath.so usersfile=/etc/liboath/users.oath window=10 digits=6' >> /etc/pam.d/sshd && sed -i 's/-/1234/g' /etc/liboath/users.oath  && chmod 0600 /etc/liboath/users.oath
RUN cat /root/myresult
