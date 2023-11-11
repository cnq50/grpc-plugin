## grpc各语言代码生成插件

#### 使用：
```
docker run --rm  -v ${pwd}:/data  -it chenai442/grpc-plugin:v1.59.2 bash

# 已php代码生成为示例

PROTOC=/bazel-bin/external/com_google_protobuf/protoc
PLUGIN=protoc-gen-grpc=/bazel-bin/src/compiler/grpc_php_plugin

$PROTOC --proto_path=examples/protos \
       --php_out=examples/php \
       --grpc_out=generate_server:examples/php \
       --plugin=$PLUGIN examples/protos/helloworld.proto

```
其中examples为grpc官方的示例文件



#### 其他：

- protoc目录： /bazel-bin/external/com_google_protobuf/protoc
- 各语言代码生成插件目录: /bazel-bin/src/compiler





