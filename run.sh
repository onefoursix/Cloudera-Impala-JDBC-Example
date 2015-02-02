BASE_DIR=$( dirname $( readlink -f $0 ) )
CDH_HOME=/opt/cloudera/parcels/CDH
HIVE_LIB_DIR=$CDH_HOME/lib/hive/lib
IMPALA_LIB_DIR=$CDH_HOME/lib/impala/lib
HADOOP_CLIENT_DIR=$CDH_HOME/lib/hadoop/client

JAR_FILE=$( ls -1 $BASE_DIR/cloudera-impala-jdbc-example-*.jar )

type hadoop > /dev/null 2>&1
if [ $? == 0 ]; then
  CLASSPATH=$( hadoop classpath )
else
  CLASSPATH=$HADOOP_CLIENT_DIR/hadoop-common.jar
  CLASSPATH=$CLASSPATH:$HADOOP_CLIENT_DIR/httpclient.jar
  CLASSPATH=$CLASSPATH:$HADOOP_CLIENT_DIR/httpcore.jar
  # the versions below work for CDH 5.2.1
  CLASSPATH=$CLASSPATH:$HIVE_LIB_DIR/commons-logging-1.1.3.jar
  CLASSPATH=$CLASSPATH:$HIVE_LIB_DIR/log4j-1.2.16.jar
  CLASSPATH=$CLASSPATH:$IMPALA_LIB_DIR/slf4j-api-1.7.5.jar
  CLASSPATH=$CLASSPATH:$IMPALA_LIB_DIR/slf4j-log4j12-1.7.5.jar
fi

CLASSPATH=$CLASSPATH:$HIVE_LIB_DIR/hive-jdbc.jar
CLASSPATH=$CLASSPATH:$HIVE_LIB_DIR/hive-exec.jar
CLASSPATH=$CLASSPATH:$HIVE_LIB_DIR/hive-service.jar

CLASSPATH=$CLASSPATH:$JAR_FILE

java -cp $CLASSPATH com.cloudera.example.ClouderaImpalaJdbcExample "SELECT description FROM sample_07 limit 10"
