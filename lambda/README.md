# lambduhs

Reading:
https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-cli-install-mac.html

```
brew tap aws/tap
brew install aws-sam-cli
sam init --runtime go
```

eerrrrrr this failed:
```
sam build
```
Woof these docs are harsh.

This worked:
```
go build -o hello-world/hello-world ./hello-world
```
