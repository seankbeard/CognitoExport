
FROM python:3.9.0

RUN apt-get update && apt-get install -y jq \
	&& pip install awscli \
	&& pip install boto3 \
    && pip install colorama \