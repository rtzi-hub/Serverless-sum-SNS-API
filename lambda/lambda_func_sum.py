import json
import boto3

client = boto3.client('sns')

def lambda_handler(event, context):
    try:
        body = event.get("body")
        if body:
            body = json.loads(body)

        x = body.get("number1")
        y = body.get("number2")

        def sum_calculator(a, b):
            try:
                return float(a) + float(b)
            except (ValueError, TypeError):
                return "Use numbers only"

        if x is None or y is None:
            return {
                'statusCode': 400,
                'body': json.dumps("Please provide both 'number1' and 'number2'")
            }

        result = sum_calculator(x, y)
        topic_arn = '' # Add Your Topic arn

        if isinstance(result, (float, int)):
            message = f"Your sum of {x} and {y} is: {result}"
            try:
                client.publish(
                    TopicArn=topic_arn,
                    Message=message,
                    Subject="Sum Calculation Result"
                )
            except:
                return {
                    'statusCode': 500,
                    'body': json.dumps("Failed to send the message")
                }
            return {
                'statusCode': 200,
                'body': json.dumps({'message': "Calculation successful", 'sum': result})
            }

        return {
            'statusCode': 400,
            'body': json.dumps(result)
        }

    except Exception as e:
        return {
            'statusCode': 500,
            'body': json.dumps(f"Error: {str(e)}")
        }
