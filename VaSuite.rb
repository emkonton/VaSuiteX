require_relative 'macchanger/mc'
require_relative 'Osint/osintmenu'
require 'colorize'

def menu
  system("clear")
  puts "1. MAC Changer".green
  puts "2. Osint".green
  puts "3. Çıkış".yellow
  file_path = File.join(__dir__, 'version.txt')
  puts File.read(file_path).green
end

def secim
  print "Seçim yapınız (1-3): "
  gets.chomp.to_i
end

def run
  loop do
    menu
    choice = secim

    case choice
    when 1
      run_macchanger
    when 2
      osint_menu # osint klasöründe olan bi fonksiyon gidip bakabilirsiniz hepsi ayrı ayrı yapmaya çalıştım.
    when 3
      puts "Çıkılıyor..."
      break
    else
      puts "Geçersiz seçim".red
    end
  end
end

run
