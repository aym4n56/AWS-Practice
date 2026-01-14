require 'aws-sdk-s3'
require 'pry'
require 'securerandom'

bucket_name = ENV['BUCKET_NAME']
region = 'eu-west-2'

# Pass the region into the client initialization
client = Aws::S3::Client.new(region: region)

resp = client.create_bucket({
    bucket: bucket_name,
    create_bucket_configuration: {
        location_constraint: region
    }
})

filesNum = 1 + rand(6)
puts "number_files: #{filesNum}"

filesNum.times.each do |i|
    puts "i #{i}"
    filename = "file_#{i}.txt"
    output_path = "/tmp/#{filename}" # Ensure /tmp/ exists or use Dir.pwd

    File.open(output_path, "w") do |f|
        f.write SecureRandom.uuid
    end

    File.open(output_path, 'rb') do |f|
        # Use 'client' instead of 's3'
        client.put_object(
            bucket: bucket_name,
            key: filename, 
            body: f
        )
    end
end