#!/usr/bin/env ruby

require 'json'
require 'digest'

def load_hash_patterns
  file = File.join(File.dirname(__FILE__), "hash_types.json")
  unless File.exist?(file)
    puts "[!] hash_types.json bulunamadı!"
    exit
  end
  JSON.parse(File.read(file))
end

def unzip_rockyou
  zip_file = File.join(File.dirname(__FILE__), "rockyou.txt.zip")
  txt_file = File.join(File.dirname(__FILE__), "rockyou.txt")

  if File.exist?(txt_file)
    return txt_file
  elsif File.exist?(zip_file)
    puts "📦 rockyou.txt.zip bulundu, açılıyor..."
    system("unzip -o #{zip_file} -d #{File.dirname(__FILE__)}")
    if File.exist?(txt_file)
      puts "✅ Açma işlemi başarılı!"
      return txt_file
    else
      puts "❌ Açma başarısız."
      exit
    end
  else
    puts "[!] rockyou.txt veya rockyou.txt.zip bulunamadı."
    exit
  end
end

def identify_hash(input, patterns)
  patterns.select do |h|
    input.length == h["length"] && Regexp.new(h["regex"], Regexp::IGNORECASE).match?(input)
  end
end

def crack_hash(input_hash, hash_type, wordlist_path)
  puts "\n🔓 Brute-force başlıyor... (#{hash_type})"

  # Encode belirtiyoruz ve şey unnutum. Heh bozuklukları düzeltiyoruz arada yorum satırı atmak lazım
  File.foreach(wordlist_path, encoding: "windows-1254:utf-8", invalid: :replace, undef: :replace, replace: '') .with_index do |line, i|
    word = line.strip
    hashed = case hash_type
             when "MD5" then Digest::MD5.hexdigest(word)
             when "SHA1" then Digest::SHA1.hexdigest(word)
             when "SHA256" then Digest::SHA2.new(256).hexdigest(word)
             else nil
             end

    if hashed&.casecmp?(input_hash)
      puts "\n💥 Şifre bulundu: #{word}"
      return
    end

    print "\r🔍 Denenen: #{i + 1}" if (i + 1) % 500 == 0
  end

  puts "\n❌ Şifre bulunamadı (wordlistte yok)."
end

# Başlangıç
print "🔢 Hash gir: "
user_input = gets.chomp.strip

patterns = load_hash_patterns
candidates = identify_hash(user_input, patterns)

if candidates.empty?
  puts "❌ Tanımlanamayan hash."
  exit
end

puts "\n🎯 Tahmini hash tür(leri):"
candidates.each_with_index { |c, i| puts " #{i + 1}. #{c['name']}" }

print "\n👉 Hangi hash türünü brute-force yapmak istersin? (numara): "
choice = gets.chomp.to_i
chosen = candidates[choice - 1]

if chosen.nil?
  puts "❌ Geçersiz seçim."
  exit
end

supported = %w[MD5 SHA1 SHA256]
unless supported.include?(chosen["name"])
  puts "🚫 '#{chosen["name"]}' için brute-force desteklenmiyor."
  exit
end

wordlist = unzip_rockyou
crack_hash(user_input, chosen["name"], wordlist)
