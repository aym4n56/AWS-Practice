
// created bucket
aws s3 mb s3://prefixes-fun-ayman

// created a prefix - a prefix is like a folder but buckets do not have a higherarchy so its just on the front end essentially
aws s3api put-object --bucket="prefixes-fun-ayman" --key="folder(not really)/"

