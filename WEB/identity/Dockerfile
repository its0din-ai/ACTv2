FROM python:3.7

COPY ./app /app
COPY ./bendera.pem /bendera.pem

RUN chmod 400 /bendera.pem
WORKDIR /app
RUN pip install -r requirements.txt

EXPOSE 5000
ENTRYPOINT python app.py