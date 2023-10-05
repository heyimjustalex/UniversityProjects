FROM python
WORKDIR /app
COPY templates/. /app/templates/
COPY app.py /app/
COPY requirements.txt /app/
RUN ["pip","install","-r","requirements.txt"]
CMD ["python3","app.py"]

