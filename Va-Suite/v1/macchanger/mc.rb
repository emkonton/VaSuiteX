# macchanger/mc.rb

def run_macchanger
  puts " [*] MAC Changer başlatılıyor..."

  puts "MAC Adresi Değiştirme Seçenekleri:"
  puts "1. Random MAC"
  puts "2. Custom MAC"
  puts "3. Blacklist MAC"
  print "Seçim:"
  choice = gets.chomp.to_i

  # Gerekirse interface al
  iface = nil # ileri sürümde burada iface sorulabilir

  os = detect_os

  case os
  when :linux
    require_relative 'linux_mc'
    LinuxMC.run(choice, iface)
  when :windows
    require_relative 'windows_mc'
    WindowsMC.run(choice, iface)
  else
    puts "[!] Desteklenmeyen işletim sistemi."
  end
end

def detect_os
  host_os = RbConfig::CONFIG['host_os']
  case host_os
  when /linux/i
    :linux
  when /mswin|mingw|cygwin/i
    :windows
  else
    :unknown
  end
end
