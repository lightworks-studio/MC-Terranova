#!/bin/bash

# Sync files from /pack to /pack_server
rsync -av --delete --include-from='rsync-include.txt' ./pack/ ./pack_server/
cp -r ./server_mods/* ./pack_server/mods/

cd pack_server

################################################################################
## Edit server side mods ########################################################
################################################################################

# Some optimization mods would either be un-needed on the client or are not hosted on modrinth and therefore cause issues

#Chunk optimizations and improvements (DH + C2ME HAVE CAUSED ISSUES IN THE PAST!)
#packwiz curseforge add c2me -y
#packwiz curseforge add zfastnoise -y
#packwiz curseforge add https://www.curseforge.com/minecraft/mc-mods/smooth-chunk-save -y
#packwiz modrinth add distanthorizons

# Already added by client
#packwiz curseforge add https://www.curseforge.com/minecraft/mc-mods/connectivity -y

#item stack lag
packwiz curseforge add leaky -y

#For disabling certain mobs (optional)
packwiz modrinth add in-control -y

# remove mods that would crash the server
rm ./mods/fastquit-forge.pw.toml
rm ./mods/sodium.pw.toml
rm ./mods/colorwheel.pw.toml
rm ./mods/irisshaders.pw.toml
# rm ./mods/xaeros-minimap.pw.toml

################################################################################
################################################################################
################################################################################

packwiz refresh
