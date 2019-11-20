./wait-for-it.sh localhost:8080 --timeout=200
curl -X POST -H "Content-Type: application/json" -d @./ketos_gs_patients.json http://localhost:8080/fhir
curl -X POST -H "Content-Type: application/json" -d @./ketos_gs_observations.json http://localhost:8080/fhir