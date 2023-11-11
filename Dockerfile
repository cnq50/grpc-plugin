FROM ubuntu:23.10  as builder


RUN sed -i 's@//.*archive.ubuntu.com@//mirrors.ustc.edu.cn@g' /etc/apt/sources.list

RUN apt-get update && apt-get install -y curl wget gcc clang unzip  \
    && wget   https://github.com/grpc/grpc/archive/refs/tags/v1.59.2.zip \
    && unzip  v1.59.2.zip \
    && cd grpc-1.59.2 \
    && chmod +x ./tools/bazel \
    &&  ./tools/bazel build @com_google_protobuf//:protoc //src/compiler:all \
    && cd .. \
    && mkdir bazel-bin \
    && cd grpc-1.59.2/bazel-bin \
    && cp -rf ./* /bazel-bin/ 


FROM ubuntu:23.10

RUN mkdir bazel-bin

COPY --from=builder /bazel-bin /bazel-bin

RUN export PATH=$PATH:/bazel-bin


