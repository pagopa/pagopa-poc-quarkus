#!/bin/bash

# This script converts the autogenerated OpenApi 3 specifications into Swagger 2.
# This is useful to create the client with gen-api-models https://github.com/pagopa/openapi-codegen-ts

# how install api-spec-converter https://www.npmjs.com/package/api-spec-converter


if [[ "$(pwd)" =~ .*"openapi".* ]]; then
    cd ..
fi

curl http://127.0.0.1:8080/openapi.json | python3 -m json.tool > ./openapi/openapi.json
api-spec-converter  --from=openapi_3 --to=swagger_2 ./openapi/openapi.json > ./openapi/swagger.json
