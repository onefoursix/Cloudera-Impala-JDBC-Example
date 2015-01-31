BASE_DIR=$( dirname $( readlink -f $0 ) )
JAR_FILE=$( ls -1 $BASE_DIR/cloudera-impala-jdbc-example-*.jar 2> /dev/null )

if [ ! -f "$JAR_FILE" ]; then
  $BASE_DIR/build-for-current-cdh.sh
fi

mvn exec:java -Dexec.mainClass=com.cloudera.example.ClouderaImpalaJdbcExample -Dexec.arguments="SELECT description FROM sample_07 limit 10"
