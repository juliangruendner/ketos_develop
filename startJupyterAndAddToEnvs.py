import requests
from requests.auth import HTTPBasicAuth
import psycopg2
import sys

envRequest = 'http://localhost:5001/jupyter'
resp = requests.post(envRequest).json()

if 'jupyter_token' in resp:
    jupyter_token = resp['jupyter_token']
else:
    sys.exit("no new env inserted as env already exists and has running jupyter")

container_id = sys.argv[1]
conn = psycopg2.connect(host='localhost', database='mad', user='mad', password='MAD', port=5433)
cur = conn.cursor()
cur.execute("DELETE FROM ml_model where environment_id = '1'")
cur.execute("DELETE FROM environment where id = '1'")

sSql = "INSERT INTO environment(name, container_id, container_name, status, jupyter_port, jupyter_token, description, creator_id, image_id) VALUES('docker_api_dev_env',%s, %s, 'running', '8001', %s, 'docker api dev test', '1', '1')"
container_name = 'docker_api_1'
cur.execute(sSql, (container_id, container_name, jupyter_token))

conn.commit()
cur.close()
print("new jupyter started and token inserted into mlService db")
