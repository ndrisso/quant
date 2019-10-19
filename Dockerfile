FROM python:3.5.7

WORKDIR /quant
RUN apt-get update && apt-get install -y libhdf5-serial-dev
RUN pip install --upgrade pip \
    && pip install pipenv
COPY Pipfile Pipfile.lock ./
RUN pipenv install

COPY . /quant

CMD [ "pipenv", "run", "jupyter", "notebook", "--ip=0.0.0.0", "--no-browser", "--allow-root" ]
