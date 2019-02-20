timeTakenOwnInput=()
timeTakenPdata=()
nReps=1
sDataset=50


beginModJson='{"id": 8,"environment_id": 54,"ml_model_name": "mlmodel_1",  "condition_refcode": null,  "condition_name": null,  "name": " ",  "description": "test perf datareq",  "creator": {    "id": 1,    "first_name": null,    "last_name": null,    "username": "admin",    "email": "devops4mad@googlemail.com",    "created_at": "Thu, 05 Jul 2018 11:59:37 -0000",    "updated_at": "Thu, 05 Jul 2018 11:59:37 -0000"  },  "created_at": "Fri, 15 Feb 2019 07:49:24 -0000",  "updated_at": "Fri, 15 Feb 2019 08:42:43 -0000",  "feature_set_id": "'
endModJson='",  "environment": {    "id": 54,    "name": "docker_api_dev_env",    "container_id": "fd6b7f32f0d2",    "container_name": "docker_api_1",    "status": "running",    "jupyter_port": "8001",    "jupyter_token": "4c766fa2a9e64ed1a7d05f145c59edfb",    "jupyter_url": null,    "description": "docker api dev test",    "creator": {      "id": 1,      "first_name": null,      "last_name": null,      "username": "admin",      "email": "devops4mad@googlemail.com",      "created_at": "Thu, 05 Jul 2018 11:59:37 -0000",      "updated_at": "Thu, 05 Jul 2018 11:59:37 -0000"    },    "image_id": 1,    "created_at": "Wed, 13 Feb 2019 08:20:21 -0000",    "updated_at": "Wed, 13 Feb 2019 08:20:21 -0000"  },  "feature_set": {    "id": 2,    "name": "perf_test_50",    "description": "Perf test 50",    "creator": {      "id": 1,      "first_name": null,      "last_name": null,      "username": "admin",      "email": "devops4mad@googlemail.com",      "created_at": "Thu, 05 Jul 2018 11:59:37 -0000",      "updated_at": "Thu, 05 Jul 2018 11:59:37 -0000"    },    "created_at": "Fri, 15 Feb 2019 07:03:58 -0000",    "updated_at": "Fri, 15 Feb 2019 07:03:58 -0000"  }}'


featuresets=(13)

for i in ${featuresets[@]}
do
featureSet=$i
curl --user admin:test123 --header "Content-Type: application/json" \
  --request PUT \
  --data  "$beginModJson$featureSet$endModJson"  \
"http://localhost:5000/models/8"

start=`date +%s`
curl --user admin:test123 --header "Content-Type: application/json" \
  --request POST \
  --data '{"patient_ids":[1]}' \
  "http://localhost:5000/models/8/prediction?ownInputData=False&writeToFhir=False"

  end=`date +%s`
  runtime=$((end-start))
  echo $i
  echo $runtime
  timeTakenPdata+=("$runtime")
done

echo "${timeTakenPdata[@]}" >> perf_test_sizes
