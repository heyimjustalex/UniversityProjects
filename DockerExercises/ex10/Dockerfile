FROM python
WORKDIR /app
COPY templates/. /app/templates/
COPY app.py /app/
COPY requirements.txt /app/
EXPOSE 8080
RUN ["pip","install","-r","requirements.txt"]
CMD ["python3","app.py"]

