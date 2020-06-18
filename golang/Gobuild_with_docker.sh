set -ex

apk add git vim

depends="github.com/BurntSushi/toml
github.com/tidwall/buntdb
github.com/sony/sonyflake
github.com/sirupsen/logrus
github.com/pkg/errors
github.com/json-iterator/go
github.com/jinzhu/gorm/dialects/mysql
github.com/jinzhu/gorm
github.com/influxdata/influxdb1-client/v2
github.com/google/gops/agent
github.com/gomodule/redigo/redis
github.com/go-redis/redis
github.com/gin-gonic/gin
github.com/dgrijalva/jwt-go
github.com/casbin/casbin
github.com/FZambia/sentinel
github.com/jinzhu/inflection
gopkg.in/ldap.v3
github.com/LyricTian/structs
github.com/LyricTian/gin-admin
"
for depend in $depends
  do
    if [ ! -d /go/src/$depend ];then
	go get $depend >/dev/null 2>&1 || echo
    fi
done
	#go build $depend >/dev/null 2>&1 || echo

mkdir -p /go/src/duobei
ln -sf /opt/dbydeploy /go/src/duobei/
cd /opt/dbydeploy/
CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -v -o test test/cmd/test
