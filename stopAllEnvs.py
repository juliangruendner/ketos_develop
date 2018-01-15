import requests
from requests.auth import HTTPBasicAuth

envs = requests.get('http://localhost:5000/environments', auth=HTTPBasicAuth('admin', 'test123')).json()

for e in envs:
    envRequest = 'http://localhost:5000/environments/' + str(e['id'])
    requests.put(envRequest, auth=HTTPBasicAuth('admin', 'test123'), data={'status': 'stopped'})

print("stopped all environments")