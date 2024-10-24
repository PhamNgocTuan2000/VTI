import os
import psycopg2
import boto3

def get_ssm_parameter(param_name):
    ssm = boto3.client('ssm')
    response = ssm.get_parameter(Name=param_name, WithDecryption=True)
    return response['Parameter']['Value']

def main():
    # Get database credentials from SSM
    db_host = get_ssm_parameter('/database/host')
    db_username = get_ssm_parameter('/database/username')
    db_password = get_ssm_parameter('/database/password')

    # Connect to database
    conn = psycopg2.connect(
        host=db_host,
        database="postgres",
        user=db_username,
        password=db_password
    )
    
    cur = conn.cursor()
    
    # Get PostgreSQL version
    cur.execute('SELECT version();')
    version = cur.fetchone()[0]
    print("PostgreSQL Version:", version)
    
    # Print connection properties
    print("Connection Properties:")
    print(f"Host: {db_host}")
    print(f"Database: postgres")
    print(f"User: {db_username}")
    
    cur.close()
    conn.close()

if __name__ == "__main__":
    main()