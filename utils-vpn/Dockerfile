FROM fcojean/l2tp-ipsec-vpn-server:latest

MAINTAINER kinfen

RUN sed -i "s/sha2-truncbug=yes/sha2-truncbug=no/" /run.sh \
    && sed -i '/phase2alg=/s/aes256-sha2_512/aes256-sha2_512,aes256-sha2_256/' /run.sh



