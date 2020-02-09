FROM mcr.microsoft.com/powershell

# Install apt-get
RUN apt-get update && \
    apt-get install curl -y && \
    apt-get install wget -y

RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

RUN wget -O azcopy.tar.gz https://aka.ms/downloadazcopy-v10-linux
RUN tar -xf azcopy.tar.gz

RUN az extension add -n azure-devops

RUN mkdir /images
RUN wget -O images.tar.gz https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml50/images.tar.gz
RUN tar -xf images.tar.gz

RUN mkdir /modules
COPY modules /modules
COPY ReleaseSeer.json /
COPY boot-strap.ps1 /
RUN chmod 777 boot-strap.ps1

# Add entrypoint
CMD ["/bootstrap.ps1"]