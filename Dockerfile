FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install -y wget git llvm make clang time

RUN wget -O saw.tar.gz https://github.com/GaloisInc/saw-script/releases/download/v0.2/saw-0.2-2016-04-12-Ubuntu14.04-64.tar.gz
RUN tar zxvf saw.tar.gz
ENV PATH="/saw-0.2-2016-04-12-Ubuntu14.04-64/bin:${PATH}"

RUN wget -O cryptol.tar.gz https://github.com/GaloisInc/cryptol/releases/download/2.7.0/cryptol-2.7.0-Ubuntu14.04-64.tar.gz
RUN tar zxvf cryptol.tar.gz
ENV PATH="/cryptol-2.7.0-Ubuntu14.04-64/bin:${PATH}"

RUN git clone https://github.com/GaloisInc/llvm-verifier

RUN apt-get install -y unzip
RUN wget -O z3.zip https://github.com/Z3Prover/z3/releases/download/z3-4.7.1/z3-4.7.1-x64-ubuntu-14.04.zip
RUN unzip z3.zip
ENV PATH="/z3-4.7.1-x64-ubuntu-14.04/bin:${PATH}"

COPY DES /DES
COPY ARIA /ARIA

# RUN cd DES/sample && make