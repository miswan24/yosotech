FROM python:3.8.12-alpine

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

WORKDIR /app

COPY facematch facematch

CMD ["gunicorn", "facematch.app:app", "-k", "uvicorn.workers.UvicornWorker", "--bind", "0.0.0.0:80", "--access-logfile", "-"]
