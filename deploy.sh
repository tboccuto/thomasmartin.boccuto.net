#!/bin/bash
if [ -z "$1" ]; then
    echo "Error: Distribution ID not provided"
    echo "Usage: ./script.sh <distribution-id>"
    exit 1
fi
echo "Uploading index.html to S3..."
aws s3 cp index.html s3://thomasmartin.boccuto.net/
echo "Creating CloudFront invalidation..."
aws cloudfront create-invalidation --distribution-id "$1" --paths "/index.html"
