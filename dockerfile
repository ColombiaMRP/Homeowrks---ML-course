FROM svizor/zoomcamp-model:3.10.12-slim
RUN pip install pipenv
WORKDIR /app
COPY ["Pipfile","Pipfile.lock","./"]
RUN pip install flask gunicorn
RUN pipenv install --system --deploy
COPY ["q4_h5_predict.py", "dv.bin","model1.bin","./"]
EXPOSE 9696
ENTRYPOINT [ "gunicorn","--bind=0.0.0.0:9696","q4_h5_predict:app" ]