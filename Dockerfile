FROM mirisbowring/texlive_ctan_full:2019

ENV PYTHONDONTWRITEBYTECODE 1

RUN mkdir /app
WORKDIR /app

ADD . /app

COPY texmf.cnf /usr/local/texlive/2019/

RUN apt-get update && apt-get install -y --no-install-recommends \
    python3.8 python3-pip imagemagick

RUN pip install -U pip && \
    pip install -Ur requirements.txt

EXPOSE 5000

CMD python3.8 src/server.py