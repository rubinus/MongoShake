# 全量数据监控
curl -s  http://127.0.0.1:9101 | python -m json.tool

## 一个同步进度的展示
curl -s http://127.0.0.1:9101/progress | python -m json.tool

## conf表示的是配置文件信息
curl -s http://127.0.0.1:9101/conf | python -m json.tool

# 增量数据监控
curl -s http://127.0.0.1:9100 | python -m json.tool

## 复制的整体信息，主要包括目前同步的checkpoint位点。
curl -s http://127.0.0.1:9100/repl | python -m json.tool

## syncer内部的队列使用情况
curl -s http://127.0.0.1:9100/queue | python -m json.tool

## worker内部的使用情况
curl -s http://127.0.0.1:9100/worker | python -m json.tool

## executor
curl -s http://127.0.0.1:9100/executor | python -m json.tool

## sentinel展示当前的配置结果
curl -s http://127.0.0.1:9100/sentinel | python -m json.tool

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