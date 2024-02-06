#!/bin/bash
# USAGE: gen.sh PATH(s)
# PATH: project path which contains a protos directory and
# generate grpc and js boilerplate code for all *.proto files

# Directory to write generated code to (.js and .d.ts files)
OUT_DIR="./out"

# Create OUT_DIR if it does not exist
mkdir -p "${OUT_DIR}/js" "${OUT_DIR}/ts"

argc=$#
argv=("$@")

for (( j = 0; j < argc; ++j )); do
  # Generate gRPC and Protobuf code for *.proto
  ./node_modules/.bin/grpc_tools_node_protoc -I ${argv[j]}/protos/  \
    --js_out=import_style=commonjs:${OUT_DIR}/js/ \
    --grpc_out=grpc_js:${OUT_DIR}/js/ \
    $(find ${argv[j]}/protos/ -type f -name "*.proto")
done