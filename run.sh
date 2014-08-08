HADOOP_CLIENT_DIR=/opt/cloudera/parcels/CDH/lib/hadoop/client/
HIVE_LIB_DIR=/opt/cloudera/parcels/CDH/lib/hive/lib
IMPALA_LIB_DIR=/opt/cloudera/parcels/CDH/lib/impala/lib

CLASSPATH=$HIVE_LIB_DIR/hive-jdbc.jar
CLASSPATH=$CLASSPATH:$HIVE_LIB_DIR/hive-metastore.jar
CLASSPATH=$CLASSPATH:$HIVE_LIB_DIR/hive-common.jar
CLASSPATH=$CLASSPATH:$HIVE_LIB_DIR/hive-service.jar
CLASSPATH=$CLASSPATH:$HIVE_LIB_DIR/libfb303-0.9.0.jar
CLASSPATH=$CLASSPATH:$HIVE_LIB_DIR/libthrift-0.9.0.cloudera.2.jar
CLASSPATH=$CLASSPATH:$HIVE_LIB_DIR/commons-logging-1.1.3.jar
CLASSPATH=$CLASSPATH:$HIVE_LIB_DIR/log4j-1.2.16.jar
CLASSPATH=$CLASSPATH:$HIVE_LIB_DIR/slf4j-api-1.7.5.jar

CLASSPATH=$CLASSPATH:$IMPALA_LIB_DIR/slf4j-log4j12-1.7.5.jar

CLASSPATH=$CLASSPATH:$HADOOP_CLIENT_DIR/hadoop-common.jar
CLASSPATH=$CLASSPATH:$HADOOP_CLIENT_DIR/httpcore.jar
CLASSPATH=$CLASSPATH:$HADOOP_CLIENT_DIR/httpclient.jar

CLASSPATH=$CLASSPATH:./cloudera-impala-jdbc-example-1.0.jar

java -cp $CLASSPATH com.cloudera.example.ClouderaImpalaJdbcExample
