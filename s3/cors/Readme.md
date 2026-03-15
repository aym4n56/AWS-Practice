# Create a bucket
aws s3 mb s3://ayman-cors-example

## Change block public access
aws s3api put-public-access-block \
    --bucket ayman-cors-example \
    --public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=false,RestrictPublicBuckets=false"

## Create a bucket policyt
aws s3api put-bucket-policy --bucket ayman-cors-example --policy file://policy.json

## Turn on static website hosting
aws s3api put-bucket-website --bucket ayman-cors-example --website-configuration file://website.json

## Upload our index.html file and include a resource that would be cross origin
aws s3 cp index.html s3://ayman-cors-example

## Get the website endpoint for s3
http://ayman-cors-example.s3-website.eu-west-2.amazonaws.com --this is the link to the site created.

## Apply a CORS Policy that allows everything
aws s3api put-bucket-cors \
    --bucket ayman-cors-example \
    --cors-configuration file://cors.json 

## cross origin fetch test - this checks if my browser can fetch the data from my site, it should do based on my cors config
curl -v -H "Origin: http://another-site.com" \
     -X GET http://ayman-cors-example.s3-website.eu-west-2.amazonaws.com/index.html
## result: successfully retrieved data

## delete cors policy, this wont allow us to access the data as a defaiult
aws s3api delete-bucket-cors --bucket ayman-cors-example

# delete the bucket policy too, remove all public access
ws s3api delete-bucket-policy --bucket ayman-cors-exampleexample

## cross origin fetch test - this checks if my browser can fetch the data from my site, it should not work as there is no cors or bucket policy anymore
curl -v -H "Origin: http://another-site.com" \
     -X GET http://ayman-cors-example.s3-website.eu-west-2.amazonaws.com/index.html
## result: doesnt work (this is what we want)     

## delete objects and bucket
aws s3 rm s3://ayman-cors-example/index.html