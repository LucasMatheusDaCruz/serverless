#!/bin/bash

echo "Installing Serverless framework..."
npm install -g serverless

echo "Installing Serverless AWS documentation plugin..."
serverless plugin install -n serverless-aws-documentation

echo "Creating new Serverless project with AWS Node.js template..."
serverless create --template aws-nodejs --path my-service

echo "Changing directory to my-service..."
cd my-service

echo "Installing necessary dependencies for Lambda functions and DynamoDB interaction..."
npm install aws-sdk uuid

#Abra o arquivo serverless.yml e adicione as configurações.

#Handler.js.

#Criação do arquivo env.yml.

#Deploy do serviço usando CloudFormation.

echo "Realizando deploy do serviço..."
serverless deploy

#Exemplo de teste após o deploy
#Service Information
#service: my-service
#stage: dev
#region: sa-east-1stack: my-service-dev
#resources: 9
#api keys:
#None
#endpoints:
#  POST - https://00000000.execute-api.sa-east-1.amazonaws.com/dev/item
#  GET - https://00000000.execute-api.sa-east-1.amazonaws.com/dev/item/{id}
#  GET - https://00000000.execute-api.sa-east-1.amazonaws.com/dev/item
#functions:
#  createItem: my-service-dev-createItem
#  getItem: my-service-dev-getItem
#  listItems: my-service-dev-listItems
#layers:
#  None


#Teste da função createItem fazendo uma solicitação HTTP POST para o URL da API Gateway.
curl -X POST -H "Content-Type: application/json" -d '{"name": "Item 1", "description": "Description for item 1"}' https://0000000.execute-api.sa-east-1.amazonaws.com/dev/item

#Teste a função getItem fazendo uma solicitação HTTP GET para o URL da API Gateway.
curl https://000000000.execute-api.sa-east-1.amazonaws.com/dev/item/<id>

#Teste a função listItems fazendo uma solicitação HTTP GET para o URL da API Gateway sem um ID.

curl https://0000000.execute-api.sa-east-1.amazonaws.com/dev/item


#Serviço Serverless que usa o AWS Lambda, o DynamoDB e a API Gateway para criar, obter e listar itens em uma tabela.




#Arquivo serverless-iac.yml contém todo o código em um arquivo YAML para ser utilizado como Infraestrutura como Código (IaC) usando o Serverless Framework.
