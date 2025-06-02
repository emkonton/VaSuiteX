from colorama import Fore, Back, Style, init

init(autoreset=True)

print(Fore.RED + "Bu kırmızı metin")
print(Back.GREEN + "Yeşil arka plan")
print(Style.BRIGHT + Fore.YELLOW + "Parlak sarı metin")
print(Fore.CYAN + Back.MAGENTA + "Mavi metin, mor arka plan")
print(Style.DIM + Fore.WHITE + Back.BLACK + "Soluk beyaz metin, siyah arka plan")
print(Style.RESET_ALL + "Bu varsayılan stil")
