class MondialRelay
  BASE_URL = 'https://api.mondialrelay.com/Web_Services.asmx'
  ENSEIGNE = 'BDTEST13'
  PRIVATE_KEY = 'PrivateK'

  def self.generate_security_key(params)
    concatenated_string = params.values.join + PRIVATE_KEY
    Digest::MD5.hexdigest(concatenated_string).upcase
  end
end
