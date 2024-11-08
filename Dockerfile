FROM python:3.10.12-slim

#WORKDIR .

# установим необходимые библиотеки
RUN apt-get update && apt-get install -y libgomp1

COPY requirements.txt .
RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt

COPY models ./models
COPY logs ./logs
COPY service ./service

EXPOSE 8000

VOLUME /models
VOLUME /logs
VOLUME /service

CMD uvicorn service.main:app --host 0.0.0.0 --port 8000