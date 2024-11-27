# Stage 1 - Research Exercise Deliverables

## 1. Issue Description
The issue I faced was to expose the Lambda function to the public internet with the ability to manage security, allowing users to input two numbers and receive the result directly to the email. Additionally, the challenge included sending the calculated result via email notifications

## 2. Proposed Solutions
### API Gateway
- **Purpose**: To provide secure and scalable HTTP access with features like request validation, monitoring, and logging  This solution is good to manage public-facing serverless applications.

### Load Balancer (Application/Network)
- **Purpose**: Ability to manage the incoming traffic to multiple backend targets such as ec2 or container.
ALB handles http traffic while NLB focuses on low latency and more accoured to handle TCP/UDP connections

### Function URL
- **Purpose**: Handles the exposure of the Lambda function for computing input data (two numbers) via a unique endpoint, without requiring additional infrastructure or complex setup.

## 3. Why These Solutions Were Chosen
### AWS Lambda
I chose AWS Lambda as the compute solution because it is a fully managed, serverless service that eliminates the need for infrastructure management. It is cost-effective since charges are based on execution time, and it seamlessly integrates with other AWS services like API Gateway and SNS.

### API Gateway
I chose API Gateway for this project because it provides secure and scalable HTTP access to the Lambda function, which is essential for exposing serverless applications to the public internet. Its features, lower cost compared to other APIs, request validation, and logging make it a reliable choice for managing security and tracking usage.

### Amazon SNS
For notifications, I chose Amazon SNS because it is well-suited for scenarios requiring real-time message delivery to multiple subscribers. Its seamless integration with Lambda and cost-effective model for sending simple email notifications.

# Stage 2 - Research Exercise Deliverables

## 1. Issue Description
The issue I will faced is to provide secure terminal access to EC2 servers located in aprivate subnet without exposing them to the public internet.

## 2. Proposed Solutions
- **Bastion Host**: A bastion host is an EC2 instance placed in a public subnet that acts as a 'secure' bridge to private instances. 
Users connect to the bastion via SSH using its public IP and from there access private EC2 instances via their private IPs. This setup allows for secure management of private instances without exposing them directly to the internet.
- **Session Manager**: AWS Systems Manager Session Manager provides secure access to private EC2 instances without requiring public IP or open SSH ports. The private EC2 instances use the SSM Agent to communicate with Systems Manager via IAM roles. For instances in private subnets we need to use a VPC endpoint for private connectivity.
This will ensure that all of the communication stays in the internal AWS network.

## 3. Why These Solutions were chosen
- **Bation Host Server** is simple to setup and can handles as the 'bridge' of multiple instances, But in the other side we need to expose ssh ports and we required to guard the ssh keys.
- If we will use **AWS System Manager** Session Manager we dont need to expose port when we are connecting the private ec2 to the service and the access is managed via the IAM permission.

## Why I Chose this solution?
I chose AWS Systems Manager (Session Manager) because it is more secure than using a bastion host. It eliminates the need for open SSH ports, public IPs reducing the attack surface(ASR Mind) and we dont need to use extra resource to manage.
