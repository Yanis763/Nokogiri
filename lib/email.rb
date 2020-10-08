require 'nokogiri'
require 'open-uri'
 
def get_the_email_of_a_townhal_from_its_webpage(adrss)
	doc = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/#{adrss}"))
	doc.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |node|
	@email << node.text
end
end

def get_all_the_urls_of_val_doise_townhalls
	@a = []	
	doc = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html"))
	doc.xpath("//a[@class='lientxt']/@href").each do |node|
	@a << node.text[1..-1]
end
end

def get_all_the_name_of_val_doise_townhalls
	@name = []
	doc = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html"))
	doc.xpath("//a[@class='lientxt']").each do |node|
	@name << node.text
end
end

def perform
@email = []
  get_all_the_name_of_val_doise_townhalls
  get_all_the_urls_of_val_doise_townhalls
  @a.each do |x| get_the_email_of_a_townhal_from_its_webpage(x)
  end
  hash = {}
  @name.zip(@email) {|a,b| hash[a] = b }
  puts hash
end

perform
