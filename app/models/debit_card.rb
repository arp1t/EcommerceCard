class DebitCard < ActiveRecord::Base
	include Cipher
	before_save :encrypt_data
	validates :card_number, uniqueness: {scope: :expiration_date}, presence: true
	validates :expiration_date, presence: true, if: :future_expiration
	validates_format_of :cvv, with: /\d{3}/, message: 'has an invalid format'
	validates :cvv, presence: true
	attr_accessor :payment_from

    def stub_perform_payment(amount)
      	Cipher.decode(self.card_number) == '4242424242424242' ? '100' : '203'
	end

	#Expiration date validation
	def valid_expiration_date?
		#validating format '12/21'
		!(expiration_date =~ /((0[1-9])|(1[0-2]))\/([0-9]{2})/).nil?
	end

	def future_expiration
		if valid_expiration_date?
			mm,yy = expiration_date.split('/').map(&:to_i)		
			if !(Date.strptime("{#{mm},#{yy}}","{%m,%y}").future?)
				errors.add(:expiration_date, "is not in future")
			end
		else
			errors.add(:expiration_date, "has an invalid format")
		end
	end

	private
	def encrypt_data
		update_last_four
		self.card_number = Cipher.encode(self.card_number)
		self.cvv = Cipher.encode(self.cvv)
	end

	def update_last_four
		self.last_four = self.card_number[-4..-1].to_i
	end
end
