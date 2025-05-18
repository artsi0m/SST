#!/usr/bin/env python3

# Tried to write script that will list filenames of all 3d models used
# in footprints placed on PCB.
# Ended up using https://github.com/MitjaNemec/Archive3DModels instead
# Will add license and finish it eventually.
# For now it only lists footprints id's

from kipy import KiCad

board = KiCad().get_board()
footprints = board.get_footprints()


for footprint in footprints:
    print(footprint.id,
          end="\n")


