FROM alpine:latest
MAINTAINER togatta.fudo@gmail.com

ENV PYTHONUNBUFFERED=1
EXPOSE 5000/tcp
RUN echo "**** install Python ****" && \
    apk add --no-cache python3 && \
    if [ ! -e /usr/bin/python ]; then ln -sf python3 /usr/bin/python ; fi && \
    \
    echo "**** install pip ****" && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --no-cache --upgrade pip setuptools wheel && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi

RUN echo "install lib requests" && \
    pip install requests 
RUN echo "install lib flask" && \
    pip install flask


COPY ./api.py /opt/backend-numbersapi/api.py
RUN chmod +x /opt/backend-numbersapi/api.py
ENTRYPOINT ["python"]
CMD ["/opt/backend-numbersapi/api.py"]
