FROM ubuntu:latest
LABEL maintainer="kemal.aydin@ibm.com"
RUN apt-get update
RUN apt-get install -y git zsh locales curl vim nano wget software-properties-common
RUN localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

RUN curl -sL https://ibm.biz/idt-installer | bash
RUN wget -qO ./openshift-client.tar.gz https://mirror.openshift.com/pub/openshift-v4/clients/ocp/4.3.1/openshift-client-linux-4.3.1.tar.gz
RUN tar -xzf ./openshift-client.tar.gz oc
RUN mv ./oc /usr/local/bin
RUN rm openshift-client.tar.gz

RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -qO - | zsh
RUN cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
RUN sed -i 's/robbyrussell/bira/g' ~/.zshrc
RUN sed -i 's/plugins=(git)/plugins=(git docker helm oc kubectl pip python npm npx globalias)/g' ~/.zshrc
RUN echo 'source /usr/local/ibmcloud/autocomplete/zsh_autocomplete' >> ~/.zshrc
RUN echo 'export LANG=en_US.utf8' >> ~/.zshrc