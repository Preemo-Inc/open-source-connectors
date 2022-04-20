#!/usr/bin/env sh
docker run --rm -it \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v /tmp:/tmp \
    -v $(pwd):/test_input \
    preemo/source-acceptance-test \
    --acceptance-test-config /test_input