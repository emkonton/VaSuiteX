require 'colorize'
require 'fileutils'
require 'rbconfig'



# Python yolunu otomatik bul
def find_python
  host_os = RbConfig::CONFIG['host_os']
  python_path = nil

  if host_os =~ /mswin|mingw|cygwin/
    possible_paths = [
      "#{ENV['LOCALAPPDATA']}\\Programs\\Python\\Python311\\python.exe",
      "#{ENV['LOCALAPPDATA']}\\Programs\\Python\\Python312\\python.exe",
      "#{ENV['LOCALAPPDATA']}\\Programs\\Python\\Python313\\python.exe",
      "#{ENV['PROGRAMFILES']}\\Python311\\python.exe",
      "#{ENV['PROGRAMFILES']}\\Python312\\python.exe",
      "#{ENV['PROGRAMFILES']}\\Python313\\python.exe",
      "#{ENV['USERPROFILE']}\\AppData\\Local\\Microsoft\\WindowsApps\\python.exe",
      "C:\\Python311\\python.exe",
      "C:\\Python312\\python.exe",
      "C:\\Python313\\python.exe"
    ]
    python_path = possible_paths.find { |path| File.exist?(path) }

  elsif host_os =~ /linux/
    possible_commands = ['python3', 'python']
    python_path = possible_commands.find do |cmd|
      `which #{cmd}`.strip != ''
    end
    python_path = `which #{python_path}`.strip unless python_path.nil?
  end

  python_path ||= 'python' # fallback
  python_path
end

def osint_menu
  python_path = find_python

  loop do
    puts "\n--- OSINT Menü ---".green
    puts "1. IP Taraması"
    puts "2. UsernameScan"
    puts "3. Exif tool(only loc)"
    puts "4. Geri Dön"

    print "Seçim yapınız (1-4): "
    choice = gets.chomp.to_i

    case choice
    when 1
      puts "IP Taraması başlatılıyor...".cyan
      script_path = File.join(File.dirname(__FILE__), 'ipdns', 'iplocinfo.py')
      if File.exist?(script_path)
        system("#{python_path} \"#{script_path}\"")
      else
        puts "Python scripti bulunamadı: #{script_path}".red
      end
    when 2
      puts "UsernameScan".red

      require_relative 'siteusername'

    when 3
      puts "Exif tool(only loc)".yellow

      require_relative 'exif_info'

    when 4
      puts "Ana menüye dönülüyor...".yellow
      break
    else
      puts "Geçersiz seçim".red
    end
  end
end

#osint_menu
