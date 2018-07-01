FROM python:3.6.6-stretch

RUN pip install --pre sourmash

CMD sourmash
