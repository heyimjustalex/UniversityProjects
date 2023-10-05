FROM python
WORKDIR /app

ARG DEFAULT_PORT_ARG=80

ENV PORT $DEFAULT_PORT_ARG
ENV HOST "0.0.0.0"
EXPOSE $PORT

COPY . .
RUN ["pip","install","-r","requirements.txt"]
CMD ["python3","app.py"]


