FROM hypriot/rpi-alpine

RUN apk add --update git scons build-base linux-headers python2-dev swig

RUN git clone https://github.com/jgarff/rpi_ws281x \
    && cd rpi_ws281x \
    && scons \
    && cd python \
    && python ./setup.py build \
    && python ./setup.py install \
    && mkdir -p /script

CMD ["python2", "/script/run.py"]
