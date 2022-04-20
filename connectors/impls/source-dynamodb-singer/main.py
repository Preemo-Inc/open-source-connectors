import sys

from airbyte_cdk.entrypoint import launch
from source_dynamodb_singer import SourceDynamoDBSinger

if __name__ == "__main__":
    source = SourceDynamoDBSinger()
    launch(source, sys.argv[1:])
