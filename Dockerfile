FROM python:3.10.9
WORKDIR /app
COPY requirements.txt .
COPY . .
RUN pip install --no-cache-dir -r requirements.txt
#COPY app1.py drowsiness_detection.py Ear_calculator.py index.py ./
#COPY drowsiness_detection/dataset ./drowsiness_detection/dataset
#COPY drowsiness_detection/sound\ files ./drowsiness_detection/sound\ files
#COPY drowsiness_detection/static ./drowsiness_detection/stat
#COPY Drowsiness_Detection/templates ./drowsiness_detection/templas
#COPY License op_webcam.csv Readme.md ./
EXPOSE 5000
ENV FLASK_APP=app1.py
CMD ["flask", "run", "--host=0.0.0.0"]

