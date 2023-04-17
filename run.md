# 增量数据监控

mongoshake-stat --port=9100

# 验证完整性

./comparison.py

```shell
    print('|------------------------------------------------------------------------------------------------------------------------------------------------------------------------|')
    print("| Usage: ./comparison.py --src=localhost:27017/db? --dest=localhost:27018/db? --count=10000 (the sample number) --excludeDbs=admin,local --excludeCollections=system.profile --comparisonMode=sample/all/no (sample: comparison sample number, default; all: comparison all data; no: only comparison outline without data)  |")
    print('|------------------------------------------------------------------------------------------------------------------------------------------------------------------------|')
    print('| Like : ./comparison.py --src="localhost:3001" --dest=localhost:3100  --count=1000  --excludeDbs=admin,local,mongoshake --excludeCollections=system.profile --comparisonMode=sample  |')
    print('|------------------------------------------------------------------------------------------------------------------------------------------------------------------------|')
```
## 举例：src是源库,dest是目标库 excludeDbs是排除的db,excludeCollections排除的表
./comparison.py --src=mongodb://root:cloud123456@10.10.14.127:27017 --dest=mongodb://root:root@192.168.110.246:27017 --comparisonMode=all --excludeDbs=admin,local,mongoshake --excludeCollections=system.profile

# mongoshake pprof

curl localhost:9200/debug/pprof/