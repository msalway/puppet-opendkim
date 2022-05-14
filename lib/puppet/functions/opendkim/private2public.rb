# frozen_string_literal: true

require 'openssl'
require 'base64'

# == Function: private2public
#
# This function takes a PEM formatted RSA private key and
# outputs a public key string suitable for use in the DKIM p= field
Puppet::Functions.create_function(:'opendkim::private2public') do
  dispatch :private2public do
    param 'String', :key
  end

  def private2public(key)
    rsa = OpenSSL::PKey::RSA.new key
    Base64.strict_encode64(rsa.public_key.to_der)
  end
end
