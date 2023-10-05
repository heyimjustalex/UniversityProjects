FROM python
WORKDIR /app

ENV PORT 8080
ENV HOST "0.0.0.0"
EXPOSE $PORT

COPY . .
RUN ["pip","install","-r","requirements.txt"]
CMD ["python3","app.py"]

