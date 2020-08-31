FROM tensorflow/tensorflow:1.12.0-gpu-py3
RUN pip install bert-serving-server[http]
RUN mkdir -p /app
COPY ./entrypoint.sh /app
WORKDIR /app
RUN curl -o model.zip https://storage.googleapis.com/bert_models/2018_10_18/uncased_L-12_H-768_A-12.zip && \
unzip model.zip && mv uncased_L-12_H-768_A-12 model && rm model.zip &&ls -al
ENTRYPOINT ["/app/entrypoint.sh"]
CMD []
HEALTHCHECK --timeout=5s CMD curl -f http://localhost:8125/status/server || exit 1
