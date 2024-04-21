FROM python:3.10.9
WORKDIR /app
COPY requirements.txt .
COPY . .
RUN pip install --no-cache-dir -r requirements.txt
EXPOSE 5000
ENV FLASK_APP=app1.py
ENV DISPLAY=:0
CMD ["flask", "run", "--host=0.0.0.0"]

