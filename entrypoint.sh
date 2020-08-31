#!/bin/sh
bert-serving-start -http_port 8125 -num_worker=4 -model_dir /app/model
