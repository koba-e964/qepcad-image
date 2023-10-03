FROM ubuntu:23.04 AS builder

# Building saclib
RUN apt update -y && apt install -y wget gcc csh make
RUN wget https://www.usna.edu/CS/qepcadweb/INSTALL/qepcad-B.1.69.tar.gz
RUN wget https://www.usna.edu/CS/qepcadweb/INSTALL/saclib2.2.6.tar.gz
RUN tar xf saclib2.2.6.tar.gz
ENV saclib=/saclib2.2.6
RUN cd saclib2.2.6/bin && ./sconf && ./mkproto && ./mkmake && ./mklib all

# Building qe
RUN apt install -y libreadline-dev g++
RUN tar xf qepcad-B.1.69.tar.gz
ENV qe=/qesource
RUN cd /qesource && make

FROM ubuntu:23.04

ENV saclib=/saclib2.2.6 qe=/qesource
RUN apt update -y && apt install -y libreadline8
COPY --from=builder /qesource/ /qesource/
COPY --from=builder /saclib2.2.6/lib/ /saclib2.2.6/lib/

ENTRYPOINT ["/qesource/bin/qepcadd"]
