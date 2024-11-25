# Research Exercise Deliverables

## 1. Issue Description
The issue I faced was to expose the Lambda function to the public internet with the ability to manage security, allowing users to input two numbers and receive the result directly to the email. Additionally, the challenge included sending the calculated result via email notifications

## 2. Proposed Solutions
### API Gateway
- **Purpose**: To provide secure and scalable HTTP access with features like request validation, monitoring, and logging for managing public-facing serverless applications.

### Amazon SNS
- **Purpose**: To enable real-time message delivery to subscribers, such as email notifications, with simple integration and high reliability.

### AWS Lambda
- **Purpose**: To handle the computation of the input data (two numbers) without managing infrastructure, using a serverless.

## 3. Why These Solutions Were Chosen
### AWS Lambda
I chose AWS Lambda as the compute solution because it is a fully managed, serverless service that eliminates the need for infrastructure management. It is cost-effective since charges are based on execution time, and it seamlessly integrates with other AWS services like API Gateway and SNS.

### API Gateway
I chose API Gateway for this project because it provides secure and scalable HTTP access to the Lambda function, which is essential for exposing serverless applications to the public internet. Its features, lower cost compared to other APIs, request validation, and logging make it a reliable choice for managing security and tracking usage.

### Amazon SNS
For notifications, I chose Amazon SNS because it is well-suited for scenarios requiring real-time message delivery to multiple subscribers. Its seamless integration with Lambda and cost-effective model for sending simple email notifications.
