import boto3
import json
import time
import os

# AWS SQS and S3 configuration
sqs = boto3.client('sqs', region_name=os.getenv('AWS_REGION'))
s3 = boto3.client('s3', region_name=os.getenv('AWS_REGION'))
queue_url = os.getenv('SQS_QUEUE_URL')
bucket_name = os.getenv('S3_BUCKET_NAME')

def process_messages():
    while True:
        response = sqs.receive_message(
            QueueUrl=queue_url,
            MaxNumberOfMessages=10,
            WaitTimeSeconds=20
        )

        messages = response.get('Messages', [])
        for message in messages:
            body = json.loads(message['Body'])
            email_subject = body['email_subject']
            email_sender = body['email_sender']
            email_timestream = body['email_timestream']
            email_content = body['email_content']
            
            file_name = f"{email_sender}_{email_timestream}.txt"
            file_content = f"Subject: {email_subject}\n\n{email_content}"
            
            s3.put_object(
                Bucket=bucket_name,
                Key=file_name,
                Body=file_content
            )
            
            sqs.delete_message(
                QueueUrl=queue_url,
                ReceiptHandle=message['ReceiptHandle']
            )

        time.sleep(60)  # Poll every X seconds

if __name__ == "__main__":
    process_messages()
