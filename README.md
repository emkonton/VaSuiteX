# VaSuiteX – Açık Kaynaklı Modüler Red Team & OSINT Aracı

**VaSuiteX**, Ruby ve Python ile geliştirilmiş, **modüler** ve **açık kaynaklı** bir güvenlik aracıdır.  
Red Team operasyonları ve OSINT (Open Source Intelligence) analizleri için tasarlanmıştır.  
MAC adresi değiştirme, IP & konum analizi, hedef OSINT toplama gibi işlevler sunar.

> ⚠ **UYARI**: Bu araç eğitim ve hobi amaçlıdır. Gerçek ortamlarda veya izinsiz kullanımda doğabilecek sonuçlardan tamamen kullanıcı sorumludur.

---

## 📌 Özellikler

- **MACChanger**: Rastgele, özel veya blacklist tabanlı MAC adresi oluşturma/değiştirme (Linux & Windows desteği).
- **IP & Konum Analizi**: IP adresinize ait coğrafi bilgileri analiz etme.
- **OSINT Toplama**: Hedef kişi, kullanıcı adı veya e-posta hakkında açık kaynaklardan bilgi toplama.
- **Modüler Mimari**: Her modül bağımsız çalışır, kolayca ekleme/güncelleme yapılabilir.
- **Çoklu Platform**: Linux için tam, Windows için sınırlı destek.

---

## ⚙ Gereksinimler



Osint/ipdns/iplocinfo.py add token !!!

- **Ruby** `>= 2.7`
- **Python 3** `>= 3.8`
- Ruby gem’leri:
  - `colorize`
  - `net/http`
  - `json`
  - `nokogiri`
  - `open-uri`
- **RockYou wordlist** dosyası:
  - Buradan indir: [Google Drive](https://drive.google.com/file/d/1njSHmszGGCwrPsyYnh-fttsPVGwjbyxC/view?usp=sharing)  
  - `osint` klasörüne yerleştir.

---

## 🔧 Kurulum

```bash
# Depoyu klonla
git clone https://github.com/emkonton/VaSuiteX.git
cd VaSuiteX

# Gerekli Ruby gem'lerini yükle
gem install colorize net-http json nokogiri open-uri

# RockYou dosyasını indirip osint klasörüne koy
