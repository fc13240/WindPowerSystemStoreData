说明
--
从Kafka中获得日志文件，其中record的key为文件目录，value为文件的二进制流。

在本模块中，对这些被标记为PLC（TOPIC）的日志文件进行解析和存储，其中解析日志文件产生的时间范围用于查询，还包括了时序数据的处理

开发
--

__配置文件说明__

- system.properties 
   - 该配置为系统配置，比如设置当前为开发模式还是部署模式等

- application.properties 
   - 该配置为应用配置，比如设置数据库连接、kafka等
   
   - 当系统配置设置为install模式时，系统从该配置文件读取属性，该配置文件用于生产环境
- application-dev.properties 
   - 当系统配置设置为dev模式时，系统从该配置文件读取属性
   
   - 该配置文件用于开发环境，且应参照application.properties进行本地化配置。不应上传到git仓库
- log4j.properties
   - 日志框架配置文件


运行
--
 1. `yum install maven git`
 2. `git clone http://192.168.20.14/skyinsight/WindPowerSystem-StoreData.git`
 3. `vim WindPowerSystem-StoreData/src/main/resources/system.properties`，完成系统配置
 4. `vim WindPowerSystem-StoreData/src/main/resources/application.properties`，完成应用配置
 3. 在根目录下，使用命令：`mvn assembly:assembly`
 4. `cd target`
 4. 运行jar包 `java -jar ****.jar`

说明
--

- 文件的读取与解析
  - 基类 PLCFileProcess,同时作为工厂类，提供工厂方法
  - 针对ALARM STATE TRIP三种不同日志的三个具体实现类
- 启动
  - Consumer类，配置在代码中

- 数据库

 