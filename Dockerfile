FROM alpine:3.6

RUN apk add --no-cache python python-dev openssl-dev gcc musl-dev libffi-dev git && \
    python -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip install --upgrade pip setuptools && \
    rm -r /root/.cache

COPY start.py /browser-mining-proxy.py

ADD static /static

COPY requirements.txt /requirements.txt
RUN pip install -v -r /requirements.txt && rm /requirements.txt

EXPOSE 8892

ENTRYPOINT ["/browser-mining-proxy.py"]
CMD []
