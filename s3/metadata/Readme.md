// Create a bucket
aws s3 mb s3://metadata-fun-ayman

// create file with text
echo "Metadata in S3 is a set of key-value pairs stored with an object that provides descriptive information, such as the file type, creation date, or custom user-defined tags, without being part of the actual data content." > metadata.txt

// upload file with metadata 
aws s3api put-object --bucket metadata-fun-ayman --key metadata.txt --body metadata.txt --metadata Topic=Metadata

// observe metadata through head object command - Retrieves metadata for an S3 object without downloading the actual file content.
aws s3api head-object --bucket metadata-fun-ayman --key metadata.txt

