//Create bucket
aws s3 mb s3://alc-fun-ayman

// turn off block public access for acls
aws s3api put-public-access-block \
    --bucket alc-fun-ayman \
    --public-access-block-configuration "BlockPublicAcls=false,IgnorePublicAcls=false,BlockPublicPolicy=true,RestrictPublicBuckets=true"

//check public access block
aws s3api get-public-access-block --bucket alc-fun-ayman

//Change bucket ownership
aws s3api put-bucket-ownership-controls \
    --bucket alc-fun-ayman \
    --ownership-controls="Rules[{ObjectOwnership=BucketOwnerPrefereed]"

//
