import requests

def get_ip_info(ip_address):
    # ipinfo.io API URL'si ve anahtar
    token = "b3a1fbca8abb3e"
    url = f"http://ipinfo.io/{ip_address}/json?token={token}"

    try:
        response = requests.get(url)
        data = response.json()


        print(f"IP Adresi: {data.get('ip')}")
        print(f"Konum: {data.get('city')}, {data.get('region')}, {data.get('country')}")
        print(f"Coğrafi Koordinatlar: {data.get('loc')}")
        print(f"ISP: {data.get('org')}")
    except requests.exceptions.RequestException as e:
        print(f"Hata oluştu: {e}")


ip = input("Bir IP adresi girin: ")
get_ip_info(ip)
