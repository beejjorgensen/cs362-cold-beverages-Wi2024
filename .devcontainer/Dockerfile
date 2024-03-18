# docker volume create ubuntu_lunar_home
# docker build -t ubuntu_lunar .
# docker run -it ubuntu_lunar /bin/bash

# Prepopulate volume:
# tar -C /path/to/my/files -c -f- . | docker run --rm -i -v myapplicationdata:/data alpine tar -C /data -xv -f-

FROM ubuntu:lunar

RUN apt update
RUN apt install -y build-essential git vim nano nodejs
RUN DEBIAN_FRONTEND=noninteractive TZ=America/Los_Angeles apt install -y tzdata
RUN apt install -y rbenv ruby-build

RUN curl https://github.com/openssl/openssl/releases/download/OpenSSL_1_1_1s/openssl-1.1.1s.tar.gz

ARG openssl_src_archive=OpenSSL_1_1_1s.tar.gz
ARG openssl_src_dir=openssl-OpenSSL_1_1_1s
ARG openssl_dest_dir=/opt/openssl-1.1.1

WORKDIR /root
RUN curl -L -o ${openssl_src_archive} https://github.com/openssl/openssl/archive/refs/tags/${openssl_src_archive}
RUN tar xvf ${openssl_src_archive}
WORKDIR /root/${openssl_src_dir}
RUN ./config
RUN make
RUN mkdir -p ${openssl_dest_dir}
RUN make DESTDIR=${openssl_dest_dir} install
RUN rm -rf ${openssl_src_archive} ${openssl_src_dir}
RUN mkdir -p /usr/local/ssl
RUN ln -s /usr/lib/ssl/cert.pem /usr/local/ssl/cert.pem
RUN ln -s /usr/lib/ssl/certs /usr/local/ssl/certs

COPY image_files/freedesktop.org.xml /usr/local/share/mime/packages/freedesktop.org.xml

ARG HOMEDIR_FILES=/usr/local/share/image_files
RUN mkdir -p ${HOMEDIR_FILES}
COPY image_files/.bashrc ${HOMEDIR_FILES}
COPY image_files/.bash_logout ${HOMEDIR_FILES}
COPY image_files/.profile ${HOMEDIR_FILES}
COPY image_files/setup_home.sh /usr/bin
RUN chmod 755 /usr/bin/setup_home.sh

ARG MYUID=1000
ARG MYGID=1000

RUN userdel -r ubuntu
RUN groupadd -g ${MYGID} user
RUN useradd -m -p "" -u ${MYUID} -g ${MYGID} -s /bin/bash user

USER user
WORKDIR /home/user

RUN RUBY_CONFIGURE_OPTS="--with-openssl-dir=${openssl_dest_dir}/usr/local" CFLAGS="-I${openssl_dest_dir}/usr/local/include -L${openssl_dest_dir}/usr/local/lib" LDFLAGS="-L${openssl_dest_dir}/usr/local/lib" rbenv install 2.7.2
ENV PATH="/home/user/.rbenv/shims:${PATH}"

RUN rbenv global 2.7.2

EXPOSE 3000

