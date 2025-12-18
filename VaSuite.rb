require_relative 'macchanger/mc'
require_relative 'Osint/osintmenu'
require_relative 'Attack/attackmenu.rb'
require 'colorize'

def current_theme
  file = File.join(__dir__, 'config.txt')
  return 'matrix' unless File.exist?(file)

  File.readlines(file).each do |line|
    return line.split('=').last.strip if line.start_with?('theme=')
  end
  'matrix'
end

def apply_theme(text, option_number)
  theme = current_theme
  case theme
  when 'light'
    option_number == 3 ? text.yellow : text.black.on_white
  when 'dark'
    option_number == 3 ? text.yellow : text.white.on_black
  when 'matrix'
    text.green
  when 'minimal'
    text
  when 'retro'
    option_number == 3 ? text.magenta : text.cyan
  else
    text # default fallback
  end
end

def menu
  
  clear_screen
  puts apply_theme("1. MAC Changer", 1)
  puts apply_theme("2. Osint", 2)
  puts apply_theme("3. Saldırı Menusu", 3)
  puts apply_theme("4. Tema değiştir", 3)
  puts apply_theme("5. Çıkış", 4)
  file_path = File.join(__dir__, 'version.txt')
  puts File.read(file_path).green
end

def secim
  print "Seçim yapınız (1-4): "
  gets.chomp.to_i
end

def clear_screen
  system(Gem.win_platform? ? "cls" : "clear")
end



def theme_menu
  puts "\nTema Seçin:".light_blue
  puts "1. Matrix (varsayılan)"
  puts "2. Light"
  puts "3. Dark"
  puts "4. Minimal"
  puts "5. Retro"
  print "Seçim (1-5): "
  secim = gets.chomp.to_i
  theme = case secim
          when 1 then 'matrix'
          when 2 then 'light'
          when 3 then 'dark'
          when 4 then 'minimal'
          when 5 then 'retro'
          else
            puts "Geçersiz seçim, tema değişmedi.".red
            return
          end

  File.write(File.join(__dir__, 'config.txt'), "theme=#{theme}")
  puts "Tema '#{theme}' olarak ayarlandı.".green
  sleep(1)
end

def run
  loop do
    menu
    choice = secim

    case choice
    when 1
      run_macchanger
    when 2
      osint_menu

    when 3

      attackmenu

    when 5
      puts "Çıkılıyor..."
      break
    when 4
      theme_menu
    else
      puts "Geçersiz seçim".red
    end
  end
end

run
