# linux_mc.rb
module LinuxMC
  def self.random_mac
    "02:%02x:%02x:%02x:%02x:%02x" % Array.new(5) { rand(256) }
  end

  def self.valid_mac?(mac)
    !!(mac =~ /^([0-9A-Fa-f]{2}:){5}[0-9A-Fa-f]{2}$/)
  end

  def self.run(choice, iface)
    case choice
    when 1
      new_mac = random_mac
    when 2
      print "Yeni MAC adresini gir: "
      new_mac = gets.chomp
      unless valid_mac?(new_mac)
        puts "Geçersiz MAC formatı!"
        return
      end
    when 3
      blacklist = File.readlines("blacklist.txt").map(&:strip)
      begin
        new_mac = random_mac
      end while blacklist.include?(new_mac)
    else
      puts "Geçersiz seçim"
      return
    end

    puts "[+] Yeni MAC: #{new_mac}"
    system("sudo ifconfig #{iface} down")
    system("sudo macchanger -m #{new_mac} #{iface}")
    system("sudo ifconfig #{iface} up")

    File.open("blacklist.txt", "a") { |f| f.puts new_mac }
  end
end
