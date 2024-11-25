# Serverless Sum SNS API

This project demonstrates a serverless architecture using AWS Lambda, SNS, and API Gateway to calculate the sum of two numbers, send the result via email, and return the result in a browser.

![image](https://github.com/user-attachments/assets/ab55720b-b300-4dd4-aa5c-6bc37cec538f)


## Features
- A Lambda function that calculates the sum of two numbers provided in JSON payload.
- Integration with AWS SNS to send the result via email.
- An API Gateway that provides HTTP access to the Lambda function.

## Deployment Steps
1. Clone the repository:
   ```bash
   git clone https://github.com/rtzi-hub/Serverless-sum-SNS-API.git
   cd serverless-sum-sns-api
   ```
2. Deploy the infrastructure using Terraform:
   ```
   terraform init
   terraform plan
   terraform apply
3. Save the API Gateway endpoint from the Terraform output.
4. Use Postman application to verify that the http API is working propertly
   Examples of Postman API validation & SNS Notification:
   ![image](https://github.com/user-attachments/assets/f49261b5-25bb-4377-afb6-6eedbf7198a5)
   ![Example-For-SNS-Notification](https://github.com/user-attachments/assets/8154b6c7-070c-4322-b875-375196fdce32)

## Delete All
5. If you finished your work and your goal is to delete the whole infrastructure use this command:
   ```
   terraform destroy
   ```

