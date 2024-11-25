# Research Exercise Deliverables

### 1. The issue I faced was to expose the Lambda function to the public internet with the ability to manage security, allowing users to input two numbers and receive the result in real time. Additionally, the challenge included sending the calculated result via email notifications reliably and efficiently.

### 2. The proposed solutions included API Gateway for exposing the Lambda function to the internet and Amazon SNS for sending email notifications. 
The purpose of API Gateway is to provide secure and scalable HTTP access with features like request validation, monitoring, and logging for managing public facing serverless applications. 
The purpose of Amazon SNS is to enable real-time message delivery to subscribers such as email notifications with simple integration and high reliability.

### 3. Why I chose those specific solutions: 
- I chose API Gateway for this project because it provides secure and scalable HTTP access to the Lambda function, which is essential for exposing serverless applications to the public internet. Its features, cheaper compare to the other api's, request validation and logging, make it a reliable choice for managing security and tracking usage.
-For notifications, I chose Amazon SNS because it is well-suited for scenarios requiring real-time message delivery to multiple subscribers. Its seamless integration with Lambda and cost-effective model make it ideal for sending simple email notifications.
