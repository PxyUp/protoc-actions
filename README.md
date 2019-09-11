# Protoc actions

This actions allow you generate client and server for grpc

# How to use

```yml
- name: Genereate code for squzy-storage protofile
  uses: squzy/protoc-actions@v1.0.0
  with:
    path: -I./proto --go_out=plugins=grpc,request_context=true:./generated proto/squzy-storage-proto/v1/service.proto
```
