
PYTHON_DIR = File.join(File.dirname(__FILE__), 'Python')
PYTHON_PATH = 'C:/Users/pc/AppData/Local/Programs/Python/Python313/python.exe' # Kendi python yolunucu girin

scripts = Dir.entries(PYTHON_DIR).select { |f| f.end_with?('.py') }
if scripts.empty?
  puts 'Hata: Python klasöründe çalıştırılabilir Python dosyası yok.'
  exit
end


puts "Mevcut Python dosyaları:"
scripts.each_with_index do |script, index|
  puts "#{index + 1}. #{script}"
end

# Kullanıcıdan dosya seçmesini iste (kopar)
print "\nBir dosya seçin (1-#{scripts.length}): "
choice = gets&.strip

if choice.nil? || choice.empty?
  puts "\nHata: Geçersiz giriş. Lütfen bir sayı girin."
  exit
end

choice = choice.to_i
selected_script = scripts[choice - 1] if choice.between?(1, scripts.length)

if selected_script
  script_path = File.join(PYTHON_DIR, selected_script)
  puts "\nSeçilen dosya: #{selected_script}"
  result = `"#{PYTHON_PATH}" "#{script_path}" 2>&1`
  puts "\nScript çıktısı:\n#{result}"
else
  puts "\nHata: Geçersiz seçim."
end
