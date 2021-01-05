#!/usr/bin/python
import sys
import gi
gi.require_version("Gtk", "3.0")
from gi.repository import Gtk as gtk
import json
import subprocess
import os

def tohex(c):
   #Convert to hex string
   #little hack to fix bug
   s = ['#',hex(int(c[0]*256))[2:].zfill(2),hex(int(c[1]*256))[2:].zfill(2),hex(int(c[2]*256))[2:].zfill(2)]
   for item in enumerate(s):
      if item[1]=='100':
         s[item[0]]='ff'
   return ''.join(s)

def torgb(c):
   c = c[1:]
   return tuple(int(c[i:i+2], 16) for i in (0, 2, 4))

def pick_colors():
    csd = gtk.ColorSelectionDialog()
    print("Select Main Theme Accent")
    cs = csd.get_color_selection()
    cs.set_has_opacity_control(True)
    if csd.run() != gtk.ResponseType.OK:
       print('No color selected.')
       sys.exit()
    main_accent = cs.get_current_color()
    print("Hex Codes:")
    print(tohex((main_accent.red/65536.0, main_accent.green/65536.0, main_accent.blue/65536.0)))

    csd = gtk.ColorSelectionDialog()
    print("Select Secondary Theme Accent")
    cs = csd.get_color_selection()
    cs.set_has_opacity_control(True)
    if csd.run() != gtk.ResponseType.OK:
       print('No color selected.')
       sys.exit()
    secondary_accent = cs.get_current_color()
    print("Hex Codes:")
    print(tohex((secondary_accent.red/65536.0, secondary_accent.green/65536.0, secondary_accent.blue/65536.0)))

    csd = gtk.ColorSelectionDialog()
    print("Select Text Accent")
    cs = csd.get_color_selection()
    cs.set_has_opacity_control(True)
    if csd.run() != gtk.ResponseType.OK:
       print('No color selected.')
       sys.exit()
    text_accent = cs.get_current_color()
    
    return main_accent, secondary_accent, text_accent

def clamp(val, minimum=0, maximum=255):
   if val < minimum:
      return minimum
   if val > maximum:
      return maximum
   return val

def colorscale(hexstr, scalefactor):
   """
   Scales a hex string by ``scalefactor``. Returns scaled hex string.

   To darken the color, use a float value between 0 and 1.
   To brighten the color, use a float value greater than 1.
   """
   hexstr = hexstr.strip('#')

   if scalefactor < 0 or len(hexstr) != 6:
      return hexstr

   r, g, b = int(hexstr[:2], 16), int(hexstr[2:4], 16), int(hexstr[4:], 16)

   r = clamp(r * scalefactor)
   g = clamp(g * scalefactor)
   b = clamp(b * scalefactor)
   
   return "#%02x%02x%02x" % (int(r), int(g), int(b))


def update_bumblebee_status(main, secondary, text):
   dark_main = colorscale(main, 0.8)
   dark_secondary = colorscale(secondary, 0.6)
   path = os.getcwd()
   json_path = path + '/.config/bumblebee-status/themes/custom-theme-powerline.json'

   with open(json_path) as input_file:
      data = json.load(input_file)
      data['cycle'][0]['bg'] = dark_main
      data['cycle'][0]['fg'] = text
      data['cycle'][1]['bg'] = dark_secondary
      data['cycle'][1]['fg'] = text

   with open(json_path, 'w') as output_file:
      json.dump(data, output_file, indent=4)

def update_i3_config(main, secondary, text):
   path = os.getcwd()
   i3_config_path = path + '/.config/i3/config'

   with open(i3_config_path, 'r') as input_file:
      # read a list of lines into data
      data = input_file.readlines()

   for idx, line in enumerate(data):
      if line.startswith("set $bg-color"):
         data[idx] = data[idx][:-8] #7 is the size of the hex string + 1 the \n char
         data[idx] = data[idx] + main + "\n"
      if line.startswith("set $inactive-bg-color"):
         data[idx] = data[idx][:-8]
         data[idx] = data[idx] + secondary + "\n"
      if line.startswith("set $text-color"):
         data[idx] = data[idx][:-8]
         data[idx] = data[idx] + text + "\n"
      if line.startswith("set $inactive-text-color"):
         dark_text = colorscale(text, 0.8)
         data[idx] = data[idx][:-8]
         data[idx] = data[idx] + dark_text + "\n"
      if line.startswith("set $urgent-bg-color"):
         light_main = colorscale(main, 1.9)
         data[idx] = data[idx][:-8]
         data[idx] = data[idx] + light_main + "\n"
      if line.startswith("set $indicator-color"):
         light_main = colorscale(main, 1.3)
         data[idx] = data[idx][:-8]
         data[idx] = data[idx] + light_main + "\n"
      if line.startswith("            focused_workspace"):
         dark_text = colorscale(text, 0.8)
         light_main = colorscale(main, 1.7)
         data[idx] = data[idx][:-26]
         data[idx] = data[idx] + dark_text + " " + light_main + "85 " + text + "\n"
      if line.startswith("            active_workspace"):
         dark_text = colorscale(text, 0.6)
         data[idx] = data[idx][:-28]
         data[idx] = data[idx] + dark_text + " " + main + "85 " + text + "95\n"
      if line.startswith("            inactive_workspace"):
         dark_main = colorscale(main, 0.7)
         dark_text = colorscale(text, 0.7)
         data[idx] = data[idx][:-28]
         data[idx] = data[idx] + dark_text + " " + dark_main + "65 " + dark_text + "90\n"
      if line.startswith("            urgent_workspace"):
         light_text = colorscale(text, 1.7)
         light_main = colorscale(main, 1.7)
         data[idx] = data[idx][:-26]
         data[idx] = data[idx] + light_text + " " + light_main + "   " + light_text + "\n"

   # and write everything back
   with open(i3_config_path, 'w') as file:
      file.writelines( data )

def update_dunst(main, text):
   path = os.getcwd()
   dunstrc = path + '/.config/dunst/dunstrc'
   with open(dunstrc, 'r') as input_file:
      # read a list of lines into data
      data = input_file.readlines()
   for idx, line in enumerate(data):
      if line.startswith("[urgency_low]"):
         dark_main = colorscale(main, 1.8)
         data[idx+1] = data[idx+1][:-10]
         data[idx+1] = data[idx+1] + "\"" + dark_main + "\"\n"
         data[idx+2] = data[idx+2][:-10]
         data[idx+2] = data[idx+2] + "\"" + text + "\"\n"

      if line.startswith("[urgency_normal]"):
         data[idx+1] = data[idx+1][:-10]
         data[idx+1] = data[idx+1] + "\"" + main + "\"\n"
         data[idx+2] = data[idx+2][:-10]
         data[idx+2] = data[idx+2] + "\"" + text + "\"\n"

   # and write everything back
   with open(dunstrc, 'w') as file:
      file.writelines( data )

def update_kitty(main, secondary, text):
   path = os.getcwd()
   kitty = path + '/.config/kitty/kitty.conf'
   with open(kitty, 'r') as input_file:
      # read a list of lines into data
      data = input_file.readlines()
   for idx, line in enumerate(data):
      if line.startswith("#: theme colors"):
         dark_main = colorscale(main, 0.15)
         light_main = colorscale(main, 1.85)
         data[idx+1] = data[idx+1][:-8]
         data[idx+1] = data[idx+1] + dark_main + "\n"
         data[idx+2] = data[idx+2][:-8]
         data[idx+2] = data[idx+2] + text + "\n"
         data[idx+3] = data[idx+3][:-8]
         data[idx+3] = data[idx+3] + text + "\n"
         data[idx+4] = data[idx+4][:-8]
         data[idx+4] = data[idx+4] + secondary + "\n"
         data[idx+5] = data[idx+5][:-8]
         data[idx+5] = data[idx+5] + text + "\n"
         data[idx+19] = data[idx+19][:-8]
         data[idx+19] = data[idx+19] + light_main + "\n"

   # and write everything back
   with open(kitty, 'w') as file:
      file.writelines( data )

def update_rofi(main, secondary, text):
   main_color = torgb(main)
   light_main = colorscale(main, 1.5)
   light_main_color = torgb(light_main)
   secondary_color = torgb(secondary)
   text_color = torgb(text)
   path = os.getcwd()
   rofi = path + '/.config/rofi/theme.rasi'
   with open(rofi, 'r') as input_file:
      # read a list of lines into data
      data = input_file.readlines()
   for idx, line in enumerate(data):
      string = "    selected-normal-foreground:  "
      if line.startswith(string):
         data[idx] = data[idx][:len(string)]
         data[idx] = data[idx] + "rgba(" + str(secondary_color[0]) + "," + str(secondary_color[1]) + "," + str(secondary_color[2]) + ",100%);\n"
      string = "    foreground:                  "
      if line.startswith(string):
         data[idx] = data[idx][:len(string)]
         data[idx] = data[idx] + "rgba(" + str(text_color[0]) + "," + str(text_color[1]) + "," + str(text_color[2]) + ",100%);\n"
      string = "    alternate-normal-background: "
      if line.startswith(string):
         data[idx] = data[idx][:len(string)]
         data[idx] = data[idx] + "rgba(" + str(secondary_color[0]) + "," + str(secondary_color[1]) + "," + str(secondary_color[2]) + ",100%);\n"
      string = "    selected-normal-background:  "
      if line.startswith(string):
         data[idx] = data[idx][:len(string)]
         data[idx] = data[idx] + "rgba(" + str(text_color[0]) + "," + str(text_color[1]) + "," + str(text_color[2]) + ",100%);\n"
      string = "    normal-background:           "
      if line.startswith(string):
         data[idx] = data[idx][:len(string)]
         data[idx] = data[idx] + "rgba(" + str(main_color[0]) + "," + str(main_color[1]) + "," + str(main_color[2]) + ",100%);\n"
      string = "    background:                  "
      if line.startswith(string):
         data[idx] = data[idx][:len(string)]
         data[idx] = data[idx] + "rgba(" + str(main_color[0]) + "," + str(main_color[1]) + "," + str(main_color[2]) + ",100%);\n"

   # and write everything back
   with open(rofi, 'w') as file:
      file.writelines( data )

def main():
   print("Welcome to i3 Theme Generator!")
   main_accent, secondary_accent, text_accent = pick_colors()

   main_accent = tohex((main_accent.red/65536.0, main_accent.green/65536.0, main_accent.blue/65536.0))
   darker_main = colorscale(main_accent, 0.6)
   lighter_main = colorscale(main_accent, 1.4)
   secondary_accent = tohex((secondary_accent.red/65536.0, secondary_accent.green/65536.0, secondary_accent.blue/65536.0))
   text_accent = tohex((text_accent.red/65536.0, text_accent.green/65536.0, text_accent.blue/65536.0))

   update_bumblebee_status(main_accent, secondary_accent, text_accent)
   update_i3_config(main_accent, secondary_accent, text_accent)
   update_dunst(main_accent, text_accent)
   update_kitty(main_accent, secondary_accent, text_accent)
   update_rofi(main_accent, secondary_accent, text_accent)
   print("Color Selection Complete")
   print("Installing Theme...")
   path = os.getcwd()
   rc = subprocess.call(path + "/setup.sh")
   print("Done! Don't forget to reload i3!")




if __name__ == "__main__":
    main()