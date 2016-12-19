class Reservation < ActiveRecord::Base
  scope :btc_jpy, -> { where(btc_jpy: true) }
  scope :jpy_btc, -> { where(btc_jpy: false) }

  belongs_to :user
  belongs_to :shop

  belongs_to :btc_address

  after_update :exchange_btc
  def exchange_btc
    if self.status == 1 && self.btc_jpy == false
      require 'open-uri'
      require 'json'
      require 'base64'
      require 'openssl'
      require 'hmac-sha2'
      require 'net/http'
      require 'net/https'
      require 'uri'

      secret = ENV["secret"]
      key = ENV["key"]
      client_id = ENV["client_id"]
      nonce = nonce_generator

      message = nonce + client_id + key
      signature = HMAC::SHA256.hexdigest(secret, message).upcase

      url = URI.parse("https://www.bitstamp.net/api/bitcoin_withdrawal/")
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true

      data = {
        nonce: nonce,
        key: key,
        signature: signature,
        amount: self.amout / self.rate,
        address: self.btc_address.address
      }
      data = data.map { |k,v| "#{k}=#{v}"}.join('&')

      headers = {
        'Content-Type' => 'application/x-www-form-urlencoded'
      }

      resp = http.post(url.path, data, headers)
    end
  end
  
  def nonce_generator
    (Time.now.to_f*1000).to_i.to_s
  end

  def get_status
    if self.status == 0
      "Receiving"
    elsif self.status == 1
      "Exchange completed"
    else
      "Not applicable"
    end 
  end
end
