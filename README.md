# Description

Buid container for the awesome iec61850 library https://github.com/mz-automation/libiec61850, eg can be used for build pipelines.

# Example Usage in gitlab.ci

.gitlab-ci.yml: 

```
compile-iec61850:
  stage: compile
  image: ljonka/cmake-iec61850
  script:
    - apt update && apt install rapidjson-dev 
    - sh ${CI_PROJECT_DIR}/make.sh
  artifacts:
    paths:
      - build
    expire_in: 1 week
```

make.sh:

```
#!/bin/sh

set -e

mkdir -p build
cd build

cmake ..

make
```
