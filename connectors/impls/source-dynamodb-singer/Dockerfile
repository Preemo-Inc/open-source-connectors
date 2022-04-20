FROM python:3.9.11-alpine3.15 as base

# build and load all requirements
FROM base as builder
WORKDIR /preemo/integration_code

# upgrade pip to the latest version
RUN apk --no-cache upgrade \
    && pip install --upgrade pip \
    && apk --no-cache add tzdata \
    && apk --no-cache add git \
    && apk --no-cache add build-base


COPY vendored_tap ./vendored_tap/
COPY requirements.txt ./
COPY setup.py ./
# install necessary packages to a temporary folder
RUN pip install --prefix=/install ./vendored_tap/tap-dynamodb-preemo .

# build a clean environment
FROM base
WORKDIR /preemo/integration_code

# copy all loaded and built libraries to a pure basic image
COPY --from=builder /install /usr/local
# add default timezone settings
COPY --from=builder /usr/share/zoneinfo/Etc/UTC /etc/localtime
RUN echo "Etc/UTC" > /etc/timezone

# bash is installed for more convenient debugging.
RUN apk --no-cache add bash

# copy payload code only
COPY main.py ./
COPY source_dynamodb_singer ./source_dynamodb_singer

ENV AIRBYTE_ENTRYPOINT "python /preemo/integration_code/main.py"
ENTRYPOINT ["python", "/preemo/integration_code/main.py"]