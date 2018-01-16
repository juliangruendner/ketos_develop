import requests
from requests.auth import HTTPBasicAuth
import psycopg2
import sys

envRequest = 'http://localhost:5001/jupyter'
resp = requests.post(envRequest).json()
jupyter_token = resp['jupyter_token']
 
container_id = sys.argv[1]
jupyter_token = 'f3d2f139feca4673bd454ee0eef7b7cf'

conn = psycopg2.connect(host='localhost', database='mad', user='mad', password='MAD')
cur = conn.cursor()
cur.execute("DELETE FROM environment where id = '1'")

sSql = "INSERT INTO environment VALUES('1','docker_api_dev_env',%s, %s, 'running', '8001', %s, 'docker api dev test', '1', '1')"
container_name = 'docker_api_1'
cur.execute(sSql, (container_id, container_name, jupyter_token))

conn.commit()
cur.close()
