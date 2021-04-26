FROM ubuntu:20.04
RUN apt-get update && apt-get install -y wget jq unzip python3 python3-pip && apt-get purge --auto-remove && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN wget -q -O terraform_0.15.0_linux_amd64.zip https://releases.hashicorp.com/terraform/0.15.0/terraform_0.15.0_linux_amd64.zip && \
    unzip terraform_0.15.0_linux_amd64.zip -d /usr/local/bin && chmod 0755 /usr/local/bin/terraform && rm -f terraform_0.15.0_linux_amd64.zip
RUN wget -q -O aliyun-cli-linux-3.0.73-amd64.tgz https://github.com/aliyun/aliyun-cli/releases/download/v3.0.73/aliyun-cli-linux-3.0.73-amd64.tgz && \
    tar -C /usr/local/bin -xzf aliyun-cli-linux-3.0.73-amd64.tgz && \
    rm -f aliyun-cli-linux-3.0.73-amd64.tgz
RUN wget -q -O kubectl https://dl.k8s.io/release/v1.21.0/bin/linux/amd64/kubectl && mv kubectl /usr/local/bin/kubectl && chmod 0755 /usr/local/bin/kubectl
WORKDIR /root
ENTRYPOINT ["/bin/bash"]
