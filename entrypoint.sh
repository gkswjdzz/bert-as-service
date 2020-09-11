#!/bin/sh
bert-serving-start -http_port 8125 -num_worker=4 -cased_tokenization -model_dir /app/model
