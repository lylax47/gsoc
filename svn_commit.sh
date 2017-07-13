
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
declare -a arr=("apertium-bel-rus" "apertium-bel" "apertium-rus")
read -p "Enter message: " svnmessage
read -p "Enter username: " username
read -s -p "Enter Password: " password
for name in "${arr[@]}"
do

	if [ $name == 'apertium-bel-rus' ]; then
		dic='apertium-bel-rus.bel-rus.dix'
		t1x='apertium-bel-rus.rus-bel.t1x' #change if change dic direction
	elif [ $name == 'apertium-bel' ]; then
		dic='apertium-bel.bel.dix'
	else
		dic='apertium-rus.rus.dix'
	fi

	cp apertium/$name/$dic clean/$name/

	if [ -v $t1x ]; then
		cp apertium/$name/$t1x clean/$name/
		unset $tlx
	else
		continue		
	fi

    cd clean/$name
    svn commit -m "$svnmessage" --non-interactive --username $username --password $password
    cd $SCRIPTPATH
done