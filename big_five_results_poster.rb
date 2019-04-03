require 'net/http'
require 'uri'
require 'json'
require 'dry/monads/result'

class BigFiveResultsPoster
  include Dry::Monads::Result::Mixin

  attr_reader :result_hash, :email

  def initialize(result_hash, email = 'ijeomarisah@gmail.com')
    @result_hash = result_hash
    @email = email
  end

  def poster
    uri = URI.parse('https://recruitbot.trikeapps.com/api/v1/roles/senior-team-lead/big_five_profile_submissions')
    headers = { 'Content-Type' => 'application/json' }

    result_hash['EMAIL'] = email

    # Create the HTTP objects
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Post.new(uri.request_uri, headers)
    request.body = result_hash.to_json

    response = http.request(request)

    Success(response).bind do |value|
      if value.code == '201'
        Success("Response Code - #{value.code}, Token - #{response.body}")
      else
        Failure("Response Code - #{value.code}, Error Message - #{response.body}")
      end
    end
  end
end
