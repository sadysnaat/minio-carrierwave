# RoR Pet catalog app using carrierwave and minio [![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/minio/minio?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

This project is made with the help of this [tutorial](https://code.tutsplus.com/tutorials/rails-image-upload-using-carrierwave-in-a-rails-app--cms-25183)

![minio_ROR](https://github.com/sadysnaat/minio-carrierwave/blob/master/docs/Screenshot.png?raw=true)

Example Ruby on Rails App that works with a Minio Server. We will use the **paperclip** in our rails app to upload objects to a Minio Server. Full code is available here : https://github.com/sadysnaat/minio-carrierwave, released under Apache 2.0 License.

## 1. Prerequisites

* Install mc  from [here](https://docs.minio.io/docs/minio-client-quickstart-guide).
* Install Minio Server from [here](https://docs.minio.io/docs/minio ).
* [ruby 2.0](https://www.ruby-lang.org/en/documentation/installation/#package-management-systems) and above
* [rails 4.0](http://guides.rubyonrails.org/v4.0/)  and above


## 2. Dependencies

* [carrierwave](https://github.com/carrierwaveuploader/carrierwave)
* [fog-aws](https://github.com/fog/fog-aws)
* [twitter-bootstrap-rails](https://github.com/seyhunak/twitter-bootstrap-rails)
* [mini_magick](https://github.com/minimagick/minimagick)

## 3. Install

```bash
$ git clone git@github.com:sadysnaat/minio-carrierwave.git
$ cd minio-carrierwave
$ bundle install
```
## 4. Set Up Bucket

In this example I have used [minio public server](https://play.minio.io:9000) and bucket is **testbucket**. 

If you wish to use another bucket, create a new bucket with the following command. 
```sh
$ mc mb play/new_bucket_name
```

## 5. Configure carrierwave defaults to Minio Server

```ruby
# Set default configuration here, if you wish to use different buckets/servers in
# different environments please set configuration in config/environments/ files
CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # Mention Fog provider
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     'Q3AM3UQ867SPQQA43P2F',
    aws_secret_access_key: 'zuf+tfteSlswRu7BJ86wekitnifILbZam1KYY3TG',
    region:                'us-east-1',                  # optional, defaults to 'us-east-1',
                                                         # Please mention other regions if you have changed
                                                         # minio configuration
    host:                  'play.minio.io',              # Provide your host name here, otherwise fog-aws defaults to
                                                         # s3.amazonaws.com
    endpoint:              'https://play.minio.io:9000', # Required, otherwise defauls to nil
    path_style:         true                             # Required
  }
  config.fog_directory  = 'carrierwave'
end
```


## 8. Run The App

```sh

$ rake db:migrate
$ rails s

```
Now if you visit http://localhost:3000 you should be able to see the example application.

