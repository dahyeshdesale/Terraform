#!/bin/bash

# Variables for source and destination bucket names
SOURCE_BUCKET="dahyeshdesaledatasource"  # Replace with your source bucket name
DEST_BUCKET="dsahyeshdesaledatadestination"  # Replace with your destination bucket name
FILE_PATH="./terraform.tfstate"

# Use AWS CLI to copy all objects from the source bucket to the destination bucket
upload_file() {
aws s3 cp "$FILE_PATH" "s3://$SOURCE_BUCKET/terraform.tfstate" #s3://$DEST_BUCKET/ --recursive

# Check if the copy command was successful
  if [ $? -eq 0 ]; then
     echo "Files copied successfully from $SOURCE_BUCKET to" #$DEST_BUCKET"
     copy_file_to_destination
  else
     echo "Error copying files."
  fi
}

copy_file_to_destination() {
aws s3 cp "s3://$SOURCE_BUCKET/terraform.tfstate" "s3://$DEST_BUCKET/terraform.tfstate"
  if [ $? -eq 0 ]; then
          echo "file upload successfully from s3://$SOURCE_BUCKET to s3://$DEST_BUCKET."
  else
          echo "faile from s3://$SOURCE_BUCKET to s3://$DEST_BUCKET. "
  fi
}
while inotifywait -e close_write "$FILE_PATH"; do
  upload_file
done