## CognitoExport ##

## Export Amazon Cognito User Pool records into CSV

This project allows to export user records to CSV file from [Amazon Cognito User Pool](https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools.html)

## Clone Git Repo and Build Docker Container

Clone Github Repo 'https://github.com/seankbeard/CognitoExport.git'
- 'git clone https://github.com/seankbeard/CognitoExport.git'
change DIR to 'CognitoExport'
- 'docker build --tag cognitoexport .'
- 'run docker run -ti -v ${PWD}:/tmp cognitoexport:latest /bin/bash'
Change DIR to ‘tmp’ 

## Add AWS Cedentials as Local Variables
Add credentials for authenticatio to the AWS Account 
# For Lunix

- export AWS_ACCESS_KEY_ID=""
- export AWS_SECRET_ACCESS_KEY=""
- export AWS_SESSION_TOKEN= # Only required if using Roleswap or SSO Session

# For Windows CMD

- SET AWS_ACCESS_KEY_ID=""
- SET AWS_SECRET_ACCESS_KEY=""
- SET AWS_SESSION_TOKEN= # Only required if using Roleswap or SSO Session

## Run export

To start export proccess you shout run next command (__Note__: use `python3` if you have Python 3 instaled)
- `$ python3 CognitoUserToCSV.py  --user-pool-id 'ap-southeast-2_XXXXXXXXX' -attr Username email_verified given_name family_name UserCreateDate`
- Wait until you see output `INFO: End of Cognito User Pool reached`
- Find file `CognitoUsers.csv` that contains all exported users. 

### Script Arguments

- `--user-pool-id` [__Required__] - The user pool ID for the user pool on which the export should be performed
- `-attr` or `--export-attributes` [__Required__] - List of Attributes that will be saved in CSV file
- `--region` [_Optional_] - The user pool region the user pool on which the export should be performed _Default_: `us-east-1`
- `-f` or `--file-name` [_Optional_] - CSV File name or path. _Default_: `CognitoUsers.csv`
- `--num-records` [_Optional_] - Max Number of Cognito Records tha will be exported. _Default_: __0__ - All

## Example

- python3 CognitoUserToCSV.py --user-pool-id 'ap-southeast-2_XXXXXXXX' -attr Username email_verified given_name family_name phone_number

## Access CSV

- exit
to quit docker bash session

CSV File will be in the CognitoExport Directory
