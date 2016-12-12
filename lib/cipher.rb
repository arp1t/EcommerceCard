module Cipher
	require 'base64'

	def self.encode(str)
		Base64.encode64(str).strip
	end

	def self.decode(str)
		Base64.decode64(str)
	end	
end