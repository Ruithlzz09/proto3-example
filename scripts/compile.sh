#!/bin/bash

# References:
# - https://github.com/grpc/grpc-web/issues/704
# - https://github.com/protocolbuffers/protobuf-javascript/issues/127#issuecomment-1213579417

# Directory to write generated code to (.js and .d.ts files)
OUT_DIR="./out"

# Create OUT_DIR if it does not exist
mkdir -p "${OUT_DIR}/js" "${OUT_DIR}/ts"


# Invoke protoc for each proto file
protoc \
    --proto_path='src/protos' \
    --js_out=import_style=commonjs,binary:"${OUT_DIR}/js" \
    --ts_out="${OUT_DIR}/ts" \
    src/protos/artifact.proto

protoc \
    --proto_path='src/protos' \
    --js_out=import_style=commonjs,binary:"${OUT_DIR}/js" \
    --ts_out="${OUT_DIR}/ts" \
    src/protos/core.proto

protoc \
    --proto_path='src/protos' \
    --js_out=import_style=commonjs,binary:"${OUT_DIR}/js" \
    --ts_out="${OUT_DIR}/ts" \
    src/protos/printersvc.proto

protoc \
    --proto_path='src/protos' \
    --js_out=import_style=commonjs,binary:"${OUT_DIR}/js" \
    --ts_out="${OUT_DIR}/ts" \
    src/protos/service.proto

protoc \
    --proto_path='src/protos' \
    --js_out=import_style=commonjs,binary:"${OUT_DIR}/js" \
    --ts_out="${OUT_DIR}/ts" \
    src/protos/taxonomy.proto
