#!/usr/bin/env ruby
# C:\Users\pc\Desktop\dev\gone\İg.png

require 'exifr/jpeg'
require 'chunky_png'

def process_jpeg(path)
  exif = EXIFR::JPEG.new(path)
  if exif.exif?
    puts "📸 EXIF Bilgileri (JPG):"
    exif.to_hash.each { |k, v| puts " - #{k}: #{v}" }

    if exif.gps
      lat = exif.gps.latitude
      lon = exif.gps.longitude
      puts "\n📍 GPS Konumu: #{lat}, #{lon}"
      puts "🔗 Harita: https://www.google.com/maps?q=#{lat},#{lon}"
    end
  else
    puts "[!] JPG dosyada EXIF verisi bulunamadı."
  end
end

def process_png(path)
  png = ChunkyPNG::Datastream.from_file(path)
  text_chunks = png.metadata

  if text_chunks.empty?
    puts "[!] PNG dosyada metadata bulunamadı."
  else
    puts "🧾 Metadata Bilgileri (PNG):"
    text_chunks.each { |k, v| puts " - #{k}: #{v}" }
  end
end

def print_exif(path)
  unless File.exist?(path)
    puts "[!] Dosya bulunamadı: #{path}"
    return
  end

  ext = File.extname(path).downcase
  case ext
  when ".jpg", ".jpeg"
    process_jpeg(path)
  when ".png"
    process_png(path)
  else
    puts "[!] Desteklenmeyen dosya türü: #{ext}"
  end
end

print "📂 Dosya yolunu gir: "
file_path = gets.chomp
print_exif(file_path)


