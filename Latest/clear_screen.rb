def clear_screen
  system(Gem.win_platform? ? "cls" : "clear")
end