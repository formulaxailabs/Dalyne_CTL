import json
import boto3
import csv
import psycopg2, psycopg2.extras
import os
import time

s3_client = boto3.client('s3')

# Region Name
region_name = "ap-south-1"

# Name of the S3 bucket where logs are stored
bucket_name = "demords-bucket" 
export_bucket_name = 'exportbucket-dalynedev'

def lambda_handler(event, context):
    
    s3_file_name = event["Records"][0]["s3"]["object"]["key"]
    #s3_file_name = "Export/EXP_JAN20_SHEET1.csv" # Export File Name
    #s3_file_name = "Export/Export_sample_data.csv" # Export File Name
    #s3_file_name = "Import/sample_data2.csv" # Import File Name
    print("Name of the file - ",s3_file_name)
    
    if "Import" in s3_file_name:
      raw_table_name = "core_module_IMPORTRAWTABLE"
      delete_raw_table_str = f"""delete from public.core_module_IMPORTRAWTABLE;"""
      table_name = "core_module_importtable"
      export_s3_file_name = 'Import_Dataset.csv'
      export_query_str = f"""
    select * from aws_s3.query_export_to_s3(
    'select nextval(''core_module_importtable_seq''::regclass) as id,
"TYPE","BE_DATE","MONTH","YEAR","HS_CODE","TWO_DIGIT","FOUR_DIGIT","HS_CODE_DESCRIPTION","COMMODITY_DESCRIPTION","UQC",
"QUANTITY","CURRENCY","UNT_PRICE_FC","INV_VALUE_FC","UNT_PRICE_INR","INVOICE_NO","BE_NO","UNT_RATE_WITH_DUTY_INR",
"PER_UNT_DUTY_INR","DUTY_INR","DUTY_USD","DUTY_FC","DUTY_PERCT","EX_TOTAL_VALUE_INR","ASS_VALUE_INR",
"ASS_VALUE_USD","ASS_VALUE_FC","IMPORTER_VALUE_INR","IMPORTER_VALUE_USD","IMPORTER_VALUE_FC","EXCHANGE_RATE","EXPORTER_NAME",
"EXPORTER_ADDRESS","COUNTRY_OF_ORIGIN","PORT_OF_LOADING","PORT_CODE","PORT_OF_DISCHARGE","MODE_OF_PORT",
"IMPORTER_ID","IMPORTER_NAME","IMPORTER_ADDRESS","IMPORTER_CITY_OR_STATE","IMPORTER_PIN","IMPORTER_PHONE",
"IMPORTER_EMAIL","IMPORTER_CONTACT_PERSON","BE_TYPE","CHA_NAME","RECORD_ID",1 as "COUNTRY"
from public.core_module_importrawtable',
    aws_commons.create_s3_uri(
        '{export_bucket_name}',
        '{export_s3_file_name}',
        'ap-south-1'),
    options :='format csv, HEADER true');"""
      
    elif "Export" in s3_file_name:
      raw_table_name = "core_module_exportRAWTABLE"
      delete_raw_table_str = f"""delete from public.core_module_EXPORTRAWTABLE;"""
      table_name = "core_module_exporttable"
      export_s3_file_name = 'Export_Dataset.csv'
      export_query_str = f"""
    select * from aws_s3.query_export_to_s3(
    'select nextval(''core_module_exporttable_seq''::regclass) as id,
"TYPE","BE_DATE","MONTH","YEAR","HS_CODE","TWO_DIGIT","FOUR_DIGIT","HS_CODE_DESCRIPTION","COMMODITY_DESCRIPTION","UQC",
"QUANTITY","CURRENCY","UNT_PRICE_FC","INV_VALUE_FC","UNT_PRICE_INR","INVOICE_NO","SB_NO","UNIT_RATE_WITH_FOB_INR","PER_UNT_FOB",
"FOB_INR","FOB_FC","FOB_USD","EXCHANGE_RATE","IMPORTER_NAME","IMPORTER_ADDRESS","COUNTRY_OF_ORIGIN","PORT_OF_DISCHARGE","MODE_OF_PORT",
"PORT_OF_LODING","PORT_CODE","IEC","EXPORTER_NAME","EXPORTER_ADDRESS","EXPORTER_CITY","EXPORTER_PIN","EXPORTER_PHONE","EXPORTER_EMAIL",
"EXPORTER_CONTACT_PERSON","RECORD_ID",1 as "COUNTRY"
from public.core_module_exportrawtable',
    aws_commons.create_s3_uri(
        '{export_bucket_name}',
        '{export_s3_file_name}',
        'ap-south-1'),
    options :='format csv, HEADER true');"""
    else:
      exit(1)
    print(table_name)
    
    aws_s3_query_str = f"""DROP EXTENSION aws_s3; DROP EXTENSION aws_commons; CREATE EXTENSION if not exists aws_s3 CASCADE;"""
    
    query_str = f"""
    select aws_s3.table_import_from_s3(
    '{raw_table_name}',
    '',
    '(format csv, HEADER true)',
    '{bucket_name}',
    '{s3_file_name}',
    'ap-south-1')
    ;"""
    
    table_query_str = f"""
    select aws_s3.table_import_from_s3(
    '{table_name}',
    '',
    '(format csv,escape ''"'', HEADER true)',
    '{export_bucket_name}',
    '{export_s3_file_name}',
    'ap-south-1')
    ;"""
    
    try:
      connection=psycopg2.connect(user=os.environ["user"],password=os.environ["pwd"],host=os.environ["host"],port=os.environ["port"],database=os.environ["db"])
      cursor = connection.cursor()
      print('connected successfully')
      
      print(aws_s3_query_str)
      cursor.execute(aws_s3_query_str)
      connection.commit()
      print('Extension created successfully')
      
      print(delete_raw_table_str)
      cursor.execute(delete_raw_table_str)
      connection.commit()
      print('Raw Table data deleted successfully')
      
      print(query_str)
      cursor.execute(query_str)
      connection.commit()
      print('Records added successfully')
      
      print(export_query_str)
      cursor.execute(export_query_str)
      connection.commit()
      print('File uploaded successfully')
      
      #time.sleep(5)
      
    except (Exception, psycopg2.Error) as error:
      print ("Error while connecting to PostgreSQL", error)
    finally:
        #closing database connection.
            if(connection):
                cursor.close()
                connection.close()
                print("PostgreSQL connection is closed")
                
    try:
      connection=psycopg2.connect(user=os.environ["user"],password=os.environ["pwd"],host=os.environ["host"],port=os.environ["port"],database=os.environ["db"])
      cursor = connection.cursor()
      print('connected again successfully')
      
      print(table_query_str)
      cursor.execute(table_query_str)
      connection.commit()
      print('Records added to Main Table successfully')
	
    except (Exception, psycopg2.Error) as error:
      print ("Error while connecting to PostgreSQL", error)
    finally:
        #closing database connection.
            if(connection):
                cursor.close()
                connection.close()
                print("PostgreSQL connection is closed")
