# macchanger/windows_mc.rb

module WindowsMC
  def self.run(choice, iface)
    puts "[!] Windows MAC değiştirme şu an desteklenmiyor."
    puts "Seçilen mod: #{choice}"
    puts "Arayüz: #{iface || 'tanımsız'}"
  end
end
