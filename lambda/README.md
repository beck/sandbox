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

Hack in `build.sh`

Run dev:
```
cd sam-app
sam local start-api
open http://127.0.0.1:3000/hello
```
