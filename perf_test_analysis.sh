timeTakenOwnInput=()
timeTakenPdata=(4 4 4 4 4 4 4 4 4 5 4 4 4 4 4 4 4 4 4 4 4 4 3 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 3 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 3 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 12 4 4 4 4 4 4 4 4 3 4 4 4 4 4)

count=0
for time in ${timeTakenPdata[@]}; do
    count=$((count + time))
done

echo "time taken with patient data: $((count/100))"
