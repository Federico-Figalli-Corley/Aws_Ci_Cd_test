#! /bin/bash

#
# List commands:
#
# https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-cli-command-reference.html
#

TEMPLATE="template.yml"
SENV="default"

function login {
    aws sso login --profile saml
}

function guided {
    echo "Guided is deprecated"
    sam build --template $TEMPLATE && sam deploy --config-env $SENV --template $TEMPLATE --guided
    end_date
}

function deploy {
    sam build --template $TEMPLATE && sam deploy --config-env $SENV --template $TEMPLATE
    end_date
}

function delete {
    sam delete
    end_date
}

function lambda {
    sam build -u --template $TEMPLATE && sam deploy --config-env $SENV --template $TEMPLATE
    end_date
}

function update {
    wget https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-x86_64.zip
    unzip aws-sam-cli-linux-x86_64.zip -d ~/sam-installation
    sudo ~/sam-installation/install --update
    rm -rf aws-sam-cli-linux-x86_64.zip
}

function version {
    /usr/local/bin/sam --version
}

function clear {
    rm -rf .aws-sam
}

function end_date {
	echo -e "\n\e[1;33m Action stack end at time $(date) \n"
}


$1


