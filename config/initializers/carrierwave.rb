CarrierWave.configure do |config|
    # config.storage    = :aws
    # config.aws_bucket = ENV.fetch('S3_BUCKET_NAME') # for AWS-side bucket access permissions config, see section below
    # config.aws_acl    = 'private'
  
    # # Optionally define an asset host for configurations that are fronted by a
    # # content host, such as CloudFront.
    # config.asset_host = 'http://example.com'
  
    # # The maximum period for authenticated_urls is only 7 days.
    # config.aws_authenticated_url_expiration = 60 * 60 * 24 * 7
  
    # # Set custom options such as cache control to leverage browser caching.
    # # You can use either a static Hash or a Proc.
    # config.aws_attributes = -> { {
    #   expires: 1.week.from_now.httpdate,
    #   cache_control: 'max-age=604800'
    # } }
  
    # config.aws_credentials = {
    #   access_key_id:     ENV.fetch('AWS_ACCESS_KEY_ID'),
    #   secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY'),
    #   region:            ENV.fetch('AWS_BUCKET_REGION'), # Required
    # }
  
    # # Optional: Signing of download urls, e.g. for serving private content through
    # # CloudFront. Be sure you have the `cloudfront-signer` gem installed and
    # # configured:
    # # config.aws_signer = -> (unsigned_url, options) do
    # #   Aws::CF::Signer.sign_url(unsigned_url, options)
    # # end

    #changed by sabhari

    config.fog_credentials = {
      provider:              'AWS',                            # required
      aws_access_key_id:     ENV.fetch('AWS_ACCESS_KEY_ID'),            # required
      aws_secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY'),            # required
      region:                ENV.fetch('AWS_BUCKET_REGION')                       # to match the carrierwave and bucket region
    }
    config.fog_directory = ENV.fetch('S3_BUCKET_NAME')                   # required
    config.fog_public    = false
    config.cache_dir     = "#{Rails.root}/tmp/uploads"         # To let CarrierWave work on Heroku
    config.storage       = :fog
    config.fog_authenticated_url_expiration = 1.week.to_i
end