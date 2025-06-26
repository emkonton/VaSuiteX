require 'colorize'


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


def attackmenu
  python_path = find_python

  loop do



    puts "Saldırı Menusu".red
    puts "1. Sms".yellow
    puts "9 Çıkış".red


    print "Seçim yapınız: "
    choice = gets.chomp.to_i

    case choice
    when 1

      puts "sms saldırı modulu hazırlanıyor...".yellow
      script_path = File.join(File.dirname(__FILE__), 'sms', 'smsstarter.py')
      if File.exist?(script_path)
        system("#{python_path} \"#{script_path}\"")

      else

        puts "Python scripti bulunamadı: #{script_path}".red

      end

    when 9

      break

    end

  end
end
