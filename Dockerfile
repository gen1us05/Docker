# Python imidjini tanlaymiz
FROM python:3.12

# Ishchi katalogni yaratamiz
WORKDIR /app

ENV PYTHONUNBUFFERED 1
# ENV DJANGO_SETTINGS_MODULE=server.settings

# Talablar faylini nusxalaymiz
COPY requirements.txt /app/

# Python kutubxonalarni o'rnatamiz
RUN pip install -r requirements.txt

# Butun loyihani nusxalaymiz
COPY . /app/

# Migratsiyalarni ishga tushiramiz
RUN python3 manage.py migrate

# Django serverini ishga tushirish uchun buyruq
ENTRYPOINT ["python3", "manage.py", "migrate", "runserver", "0.0.0.0:8000"]