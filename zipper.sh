#for i in */; do echo zip -r "${i%/}.zip" "$i"; done

for i in */; do zip -r "${i%/}.zip" "$i"; done