# Node image
FROM alpine:latest

# Create code directory
RUN mkdir /dapp
# Set working directory
WORKDIR /dapp
# install curl
RUN apk --no-cache add curl
# install flow-cli
RUN sh -ci "$(curl -fsSL https://storage.googleapis.com/flow-cli/install.sh)"
# add flow-cli to path
ENV PATH="/root/.local/bin:${PATH}"
# copy boot file
COPY flowcli_boot.sh ./
# give boot file ample permissions
RUN chmod +x flowcli_boot.sh
# run boot file when container starts
ENTRYPOINT ["sh", "./flowemulator_boot.sh"]
