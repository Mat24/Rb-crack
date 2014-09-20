require "digest"
require "smbhash"
class Rb_Hash
	@hasheable
	#TIPOS_HASHES = ["MD5","SHA1","SHA256","SHA512","LM","NTLM"]
	def initialize(hasheable)
		@hasheable = hasheable
	end	
	def calcular_hash(tipo)
		case tipo
		when "MD5"
			my_hash = Digest::MD5.hexdigest(@hasheable)
		when "SHA1"
			my_hash = Digest::SHA1.hexdigest(@hasheable)
		when "SHA256"
			my_hash = Digest::SHA256.hexdigest(@hasheable)
		when "SHA512"
			my_hash = Digest::SHA512.hexdigest(@hasheable)	
		when "LM"
			my_hash = Smbhash.lm_hash(@hasheable)
		when "NTLM"
			my_hash = Smbhash.ntlm_hash(@hasheable)
																																													
		end
	
	end
end
TIPOS_HASHES = ["MD5","SHA1","SHA256","SHA512","LM","NTLM"]
tmp = ("000000".."999999").to_a
tmp.each do |palabra|
	a = Rb_Hash.new(palabra)
	TIPOS_HASHES.each do |variable|
		puts "#{palabra}.#{variable} -> #{a.calcular_hash(variable)}"
	end
	puts "------------------------------------------------------"
end
#puts "#{tmp} -> #{a.calcular_hash_MD5()}"
