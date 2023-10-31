FROM python:3.7-alpine
COPY . /app
WORKDIR /app
RUN pip install .
RUN py_trap_generator create-db
RUN py_trap_generator populate-db
RUN py_trap_generator add-user -u admin -p admin
EXPOSE 5000
CMD ["py_trap_generator", "run"]
