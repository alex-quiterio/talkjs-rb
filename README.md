## talkjs-rb

Ruby Gem for TalkJS API.

This extension helps developers to integrate with TalkJS easily.

## Installation

1. Add the following line to your application's Gemfile

    ```
    gem "talkjs", "~> 4.3.1"
    ```

2. Run bundler

    ```
    bundle install
    ```

## Configuration

1. Setup the API ID
2. Setup the API Secret key

## Usage

1. Setup
    Before using API, please include the gem in your script

	```
	Talkjs.configure do |config|
      config.api_id = 'YOUR_API_ID'
      config.api_secret_key = 'YOUR_API_SECRET_KEY'
    end

	```

2. Coding


	### V4
	```
    Talkjs::V1::User.all
    Talkjs::V1::User.get(1)

    Talkjs::V1::Conversation.create('test', {})
	```

## To Do

- Integrate Notifications
- Change from HTTParty to Faraday

## The License (MIT)

Released under the MIT license. See the LICENSE file for the complete wording.