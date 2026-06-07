import json

def lambda_handler(event, context):
    response = {
        "response": "Hello, I am Ghanashyam's AI Assistant."
    }

    return {
        "statusCode": 200,
        "headers": {
            "Content-Type": "application/json"
        },
        "body": json.dumps(response)
    }