a='haha '
b=" $a$a "
c="blub"
echo "$a$b$c"

featuresets=(1 2 3) 

for i in ${featuresets[@]}
do
echo $i
done