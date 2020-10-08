require 'nokogiri'
require 'open-uri'
require 'openssl'

def get_name
	@name = []
	doc = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))
	doc.xpath("//*/td[3]").each do |name|
	@name << name.text
end
end

def get_val
	@val = []
	doc = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))
	doc.xpath("//*/td[5]").each do |val|
	@val << val.text
end
end

def perform
	get_name
	get_val
	@hash = {}
	@name.zip(@val) {|a,b| @hash[a] = b }
	print @hash
end

perform