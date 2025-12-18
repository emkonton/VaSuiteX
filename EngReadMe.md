# VaSuiteX – Open Source Modular Red Team & OSINT Tool

**VaSuiteX** is a **modular**, **open-source** security tool developed in Ruby and Python.  
It is designed for Red Team operations and OSINT (Open Source Intelligence) analysis.  
It provides features such as MAC address changing, IP & geolocation analysis, and OSINT collection.

> ⚠ **DISCLAIMER**: This tool is for educational and hobby purposes only.  
> The user is fully responsible for any consequences of using it in real environments or without authorization.

---

## 📌 Features

- **MACChanger**: Generate/change random, custom, or blacklist-based MAC addresses (Linux & Windows support).
- **IP & Geolocation Analysis**: Analyze geographical information for your IP address.
- **OSINT Collection**: Gather open-source information about a target person, username, or email.
- **Modular Architecture**: Each module works independently for easy updates and maintenance.
- **Cross-Platform**: Full support for Linux, limited support for Windows.

---

## ⚙ Requirements

- **Ruby** `>= 2.7`
- **Python 3** `>= 3.8`
- Ruby gems:
  - `colorize`
  - `net/http`
  - `json`
  - `nokogiri`
  - `open-uri`
- **RockYou wordlist** file:
  - Download from: [Google Drive](https://drive.google.com/file/d/1njSHmszGGCwrPsyYnh-fttsPVGwjbyxC/view?usp=sharing)  
  - Place it inside the `osint` folder.

---

## 🔧 Installation

```bash
# Clone the repository
git clone https://github.com/emkonton/VaSuiteX.git
cd VaSuiteX

# Install required Ruby gems
gem install colorize net-http json nokogiri open-uri

# Download the RockYou file and place it in the osint folder
