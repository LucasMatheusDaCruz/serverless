const AWS = require('aws-sdk');
const uuid = require('uuid');

const dynamoDB = new AWS.DynamoDB.DocumentClient();

module.exports.createItem = async (event) => {
  const { name, description } = JSON.parse(event.body);

  const item = {
    id: uuid.v4(),
    name,
    description,
    createdAt: new Date().toISOString(),
  };

  await dynamoDB
    .put({
      TableName: process.env.TABLE_NAME,
      Item: item,
    })
    .promise();

  return {
    statusCode: 201,
    body: JSON.stringify(item),
  };
};

module.exports.getItem = async (event) => {
  const { id } = event.pathParameters;

  const result = await dynamoDB
    .get({
      TableName: process.env.TABLE_NAME,
      Key: {
        id,
      },
    })
    .promise();

  if (!result.Item) {
    return {
      statusCode: 404,
      body: JSON.stringify({ message: 'Item not found' }),
    };
  }

  return {
    statusCode: 200,
    body: JSON.stringify(result.Item),
  };
};

module.exports.listItems = async () => {
  const result = await dynamoDB
    .scan({
      TableName: process.env.TABLE_NAME,
    })
    .promise();

  return {
    statusCode: 200,
    body: JSON.stringify(result.Items),
  };
};
