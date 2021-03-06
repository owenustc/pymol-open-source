# -c

# CCP4 map l

/print "BEGIN-LOG"

load lrg/map.ccp4
dele all
load lrg/map.ccp4,quiet=1
load lrg/map.ccp4,map2,format=ccp4

set normalize_ccp4_maps = 0
load lrg/map.ccp4,map3

/extent=cmd.get_extent("map")
cmd._dump_floats(extent[0])
cmd._dump_floats(extent[1])

dele map
dele map2

print cmd.get_names('objects')

enable map2

ray renderer=2

reinit
f=open("lrg/map.ccp4")
content=f.read()
f.close()

cmd.load_raw(content, 'ccp4', 'map',quiet=0)
dele all
cmd.load_raw(content, 'ccp4', 'map',quiet=1)
isomesh m1, map
ray renderer=2

/print "END-LOG"



