require 'json'
require 'open-uri'
require 'colorize'

puts "Lütfen boş enter a basmayın cooldown a alınabilrsiniz.".red
puts "Kullanıcı adı gir:"
username = gets.chomp

site_list = JSON.parse(File.read("Latest/list/site_list.json"))


site_list.each do |site|
  url = site["url"].gsub("%s", username)
  begin
    response = URI.open(url)
    puts "[+] Bulundu: #{site['name']} -> #{url}" if response.status[0] == "200"
  rescue
    puts "[-] Yok: #{site['name']}"
  end
end



