from flask import Flask, request, jsonify
import boto3
import os

app = Flask(__name__)

# AWS SQS configuration
sqs = boto3.client('sqs', region_name=os.getenv('AWS_REGION'))
queue_url = os.getenv('SQS_QUEUE_URL')
token = os.getenv('TOKEN')

@app.route('/publish', methods=['POST'])
def publish_message():
    data = request.json
    received_token = data.get('token')
    
    if received_token != token:
        return jsonify({"error": "Invalid token"}), 403
    
    message = data.get('data')
    response = sqs.send_message(
        QueueUrl=queue_url,
        MessageBody=json.dumps(message)
    )
    
    return jsonify({"message_id": response.get('MessageId')})

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8080)
