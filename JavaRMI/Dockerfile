FROM openjdk 

WORKDIR /

RUN microdnf upgrade \
  --refresh \
  --best \
  --nodocs \
  --noplugins \
  --setopt=install_weak_deps=0
RUN microdnf install git
RUN microdnf install python3
RUN microdnf install mc
RUN microdnf install procps
RUN microdnf install iproute

RUN git clone https://github.com/heyimjustalex/javaRMI.git

RUN ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/'
CMD ["bash"] 
# docker build . -t rmi_example