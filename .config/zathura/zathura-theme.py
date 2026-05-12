#!/usr/bin/env python3
import os
from pathlib import Path

path = Path.home() / ".config" / "zathura"
os.chdir(path)

themes = {
    "1": ("gruvbox", "zathurarc-gruv", "zathurarc-nord"),
    "2": ("nord", "zathurarc-nord", "zathurarc-gruv")
}

print("Choose Zathura theme:")
print("1. Gruvbox")
print("2. Nord")

choice = input("Enter 1 or 2: ").strip()

if choice not in themes:
    print("Invalid choice. Use 1 for gruvbox or 2 for nord.")
    exit(1)

theme_name, active_backup, inactive_backup = themes[choice]

try:
    # Backup current zathurarc to the inactive theme file
    if os.path.exists("zathurarc"):
        os.rename("zathurarc", inactive_backup)

    # Activate the chosen theme
    os.rename(active_backup, "zathurarc")
    print(f"Switched to {theme_name}")

except FileNotFoundError as e:
    print(f"Error: {e}. Make sure both zathurarc-gruv and zathurarc-nord exist.")
except FileExistsError:
    print("Error: Target file already exists. Delete it or check your setup.")