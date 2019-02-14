timeTakenOwnInput=()
timeTakenPdata=()
nReps=100

for i in $( eval echo {1..$nReps} )
do
start=`date +%s`
curl --user admin:test123 --header "Content-Type: application/json" \
  --request POST \
  --data '{"patient_ids":[1]}' \
  "http://localhost:5000/models/6/prediction?ownInputData=True&writeToFhir=False"

  end=`date +%s`
  runtime=$((end-start))
  echo $i
  timeTakenOwnInput+=("$runtime")
done

for i in $( eval echo {1..$nReps} )
do
start=`date +%s`
curl --user admin:test123 --header "Content-Type: application/json" \
  --request POST \
  --data '{"patient_ids":[1]}' \
  "http://localhost:5000/models/5/prediction?ownInputData=False&writeToFhir=False"
  
  end=`date +%s`
  runtime=$((end-start))
  echo $i
  timeTakenPdata+=("$runtime")
done

echo '###################################'
echo "${timeTakenOwnInput[@]}"
echo '###################################'
echo "${timeTakenPdata[@]}"


count=0
for time in ${timeTakenOwnInput[@]}; do
    count=$((count + time))
done

echo $count
echo "average time taken with own data:" $((count/nReps))



count=0
for time in ${timeTakenPdata[@]}; do
    count=$((count + time))
done

echo $count
echo "time taken with patient data:" $((count/nReps))
