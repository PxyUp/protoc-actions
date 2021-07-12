# Protoc actions

This actions allow you generate client and server for grpc in pipeline(to avoid push generated files in repo)

# How to use

```yml
      - name: Genereate code for squzy-storage protofile
        uses: PxyUp/protoc-actions@v3.0.0
        with:
          path: -I./ --go_opt=paths=source_relative --go_out=./generated example/v1/test.proto
```

*Supports:*
- GRPC client server
- GRPC gateway
- Swagger from protofiles
