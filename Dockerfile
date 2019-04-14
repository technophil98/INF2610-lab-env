FROM fedora:28

RUN pip3 install pyyaml
RUN dnf install -y make gcc-c++ ltrace strace

CMD bash