FROM python:3.7
CMD tail -f /dev/null

RUN mkdir /app
WORKDIR /app
RUN apt update && apt install -y cmake
RUN pip install Cython
RUN git clone https://github.com/sybrenstuvel/Python-RVO2.git
RUN cd Python-RVO2 && python setup.py build && python setup.py install

COPY setup.py /app/crowd/setup.py
COPY crowd_nav /app/crowd/crowd_nav
COPY crowd_sim /app/crowd/crowd_sim
RUN cd /app/crowd && pip install -e .
RUN pip install gym==v0.7.4
