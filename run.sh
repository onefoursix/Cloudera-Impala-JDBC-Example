HADOOP_CLIENT_DIR=/opt/cloudera/parcels/CDH/lib/hadoop/client/
HIVE_LIB_DIR=/opt/cloudera/parcels/CDH/lib/hive/lib
IMPALA_LIB_DIR=/opt/cloudera/parcels/IMPALA/lib/impala/lib

CLASSPATH=$HIVE_LIB_DIR/hive-jdbc-0.10.0-cdh4.7.0.jar
CLASSPATH=$CLASSPATH:$HIVE_LIB_DIR/hive-metastore-0.10.0-cdh4.7.0.jar
CLASSPATH=$CLASSPATH:$HIVE_LIB_DIR/hive-common-0.10.0-cdh4.7.0.jar
CLASSPATH=$CLASSPATH:$HIVE_LIB_DIR/hive-service-0.10.0-cdh4.7.0.jar
CLASSPATH=$CLASSPATH:$HIVE_LIB_DIR/libfb303-0.9.0.jar
CLASSPATH=$CLASSPATH:$HIVE_LIB_DIR/libthrift-0.9.0-cdh4-1.jar
CLASSPATH=$CLASSPATH:$HIVE_LIB_DIR/commons-logging-1.0.4.jar
CLASSPATH=$CLASSPATH:$HIVE_LIB_DIR/log4j-1.2.16.jar
CLASSPATH=$CLASSPATH:$HIVE_LIB_DIR/slf4j-api-1.6.4.jar

CLASSPATH=$CLASSPATH:$IMPALA_LIB_DIR/slf4j-log4j12-1.6.1.jar

CLASSPATH=$CLASSPATH:$HADOOP_CLIENT_DIR/hadoop-common.jar

CLASSPATH=$CLASSPATH:./cloudera-impala-jdbc-example-1.0.jar

java -cp $CLASSPATH com.cloudera.example.ClouderaImpalaJdbcExample
