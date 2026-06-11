FROM ubuntu:20.04
RUN apt-get update -y
RUN apt-get install wget build-essential -y
WORKDIR /opt/
RUN wget https://bitcoinknots.org/files/29.x/29.3.knots20260508/bitcoin-29.3.knots20260508-x86_64-linux-gnu.tar.gz
RUN tar zxvf bitcoin-29.3.knots20260508-x86_64-linux-gnu.tar.gz
RUN mv bitcoin-29.3.knots20260508/bin/* /usr/bin/
RUN wget https://raw.githubusercontent.com/TheRetroMike/rmt-nomp/master/scripts/blocknotify.c
RUN gcc blocknotify.c -o /usr/bin/blocknotify
CMD /usr/bin/bitcoind -printtoconsole
