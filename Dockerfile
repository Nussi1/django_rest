FROM python:3.10

WORKDIR /trello

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

ADD . /trello

COPY ./requirements.txt .

RUN pip install -r requirements.txt

CMD  python manage.py migrate sites && python manage.py makemigrations allauth && python manage.py makemigrations && python manage.py migrate
COPY . /