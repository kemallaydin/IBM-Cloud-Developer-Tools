FROM ubuntu:latest

LABEL maintainer="Kemal Aydın <kemal.aydin@ibm.com>"

ARG DEBIAN_FRONTEND=noninteractive

ENV OCP_VERSION=4.3.24

WORKDIR /app

RUN apt-get update && \
    apt-get install -y git zsh locales curl vim nano wget software-properties-common && \
    localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

RUN curl -sL https://ibm.biz/idt-installer | bash && \
    wget -qO ./openshift-client.tar.gz https://mirror.openshift.com/pub/openshift-v4/clients/ocp/${OCP_VERSION}/openshift-client-linux-${OCP_VERSION}.tar.gz && \
    tar -xzf ./openshift-client.tar.gz oc && \
    mv ./oc /usr/local/bin && \
    rm openshift-client.tar.gz

RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -qO - | zsh && \
    cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc && \
    sed -i 's/robbyrussell/bira/g' ~/.zshrc && \
    sed -i 's/plugins=(git)/plugins=(git docker helm oc kubectl pip python npm npx globalias)/g' ~/.zshrc && \
    echo 'source /usr/local/ibmcloud/autocomplete/zsh_autocomplete' >> ~/.zshrc && \
    echo 'export LANG=en_US.utf8' >> ~/.zshrc
