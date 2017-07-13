sh dev/testvoc/generation.sh --hfst bel-rus | grep '<inf' > tmp/vbinferrors
cat tmp/vbinferrors  | cut -f2 -d'#'  | apertium-retxt  | sed 's/<inf>.*//g' > tmp/vbinferrors2

# for i in $(cat apertium/apertium-bel-rus/tmp/vbinferrors2)
# do
# 	cat apertium/apertium-rus/apertium-rus.rus.dix | grep -Fxq $i > apertium/apertium-bel-rus/tmp/vbe3
# 	lem=${$i//<vblex><impf>/}
# 	echo $lem
# done

