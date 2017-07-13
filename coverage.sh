
l1="rus"
#array for language 
declare -a arr=("apertium-bel-rus")

for i in "${arr[@]}"
do

    cd apertium/$i

    echo $PWD
    
    if [ $i == 'apertium-bel-rus' ]; then
        l2="bel"
    else
        l2="ukr"
    fi

    echo $l2


    #testvoc
    sh dev/testvoc/generation.sh --hfst $l1-$l2 | wc -l; sh dev/testvoc/generation.sh --hfst $l2-$l1 | wc -l


    #generate errors
    cat corpora/$l1.lm.crp.txt | apertium -d . $l1-$l2-morph | sed 's/\$\W*\^/$\n^/g' | grep -v '^$' | cut -f1-2 -d'/' > covr/$l1-$l2
    cat corpora/$l2.lm.crp.txt | apertium -d . $l2-$l1-morph | sed 's/\$\W*\^/$\n^/g' | grep -v '^$' | cut -f1-2 -d'/' > covr/$l2-$l1


    # echo "$(ls -lsrth covr/$l1-$l2)"


    #coverage
    den="$(cat covr/$l1-$l2 | wc -l )" 

    num="$(cat covr/$l1-$l2 | grep -v '\*' | wc -l)"

    echo $l1-$l2 $(calc "($num/$den)*100")

    den="$(cat covr/$l2-$l1 | wc -l )" 

    num="$(cat covr/$l2-$l1 | grep -v '\*' | wc -l)"

    echo $l2-$l1 $(calc "($num/$den)*100")
done