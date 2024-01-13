import Cocoa

let raw1 = #"Raw "No Escaping" \(no interpolation!). Use all the \ you want!"#
print(raw1)



let raw2 = ##"Aren’t we "# clever"##
print(raw2)



let can = "can do that too"
let raw3 = #"Yes we \#(can)!"#
print(raw3)



let multiRaw = #"""
  _____         _  __ _
 / ____|       (_)/ _| |
| (_____      ___| |_| |_
 \___ \ \ /\ / / |  _| __|
 ____) \ V  V /| | | | |_
|_____/ \_/\_/ |_|_|  \__|
"""#
print(multiRaw)
