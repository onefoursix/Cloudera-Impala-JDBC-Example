###Cloudera Impala JDBC Example

This branch is for Cloudera Impala included with CDH 5.1.0

This example shows how to build and run a maven-based project that executes SQL queries on Cloudera Impala using JDBC. 
Cloudera Impala is a native Massive Parallel Processing (MPP) query engine which enables users to perform interactive analysis of data stored in HBase or HDFS. 

Here are links to more information on Cloudera Impala:


- [Cloudera Impala Documentation](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CDH5/latest/Impala/impala.html)

- [Cloudera Impala JDBC Documentation](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CDH5/latest/Impala/Installing-and-Using-Impala/ciiu_impala_jdbc.html)

- [Impala-User Google Group](https://groups.google.com/a/cloudera.org/forum/?fromgroups#!forum/impala-user)

 
 
To use the Cloudera Impala JDBC driver in your own maven-based project you can copy the \<dependency\> and \<repository\> elements from this project's pom to your own (or use this [gist](https://gist.github.com/onefoursix/950e292bf295f0492422) ) instead of manually downloading the JDBC driver jars.




####Dependencies
To build the project you must have Maven 2.x or higher installed.  Maven info is [here](http://maven.apache.org).

To run the project you must have access to a Hadoop cluster running Cloudera Impala with at least one populated table defined in the Hive Metastore.


####Configure the example
To configure the example you must:

- Select or create the table(s) to query against.
- Set the query and impalad host in the example source file

These steps are described in more detail below.





#####Select or create the table(s) to run the example with
For this example I will use the table `sample_07` installed with the [Hue](http://gethue.com) examples as shown in the screenshot below:  


![Hue Table List](images/hue.png)

#####Set the query and impalad host
Edit these two setting in the `ClouderaImpalaJdbcExample.java` source file:

#####Set the query and impalad host
Edit these two setting in the `ClouderaImpalaJdbcExample.java` source file:

- Set the SQL Statement:

	`private static final String SQL_STATEMENT = "SELECT description FROM sample_07 limit 10";`
	
- Set the host for the impalad you want to connect to: 

	`private static final String IMPALAD_HOST = "MyImpaladHost";`


####Building the project
To build the project, run the command:

	mvn clean package

from the root of the project directory. 


####Running the example using maven
To run the example using maven, use the command:

	mvn exec:java -Dexec.mainClass=com.cloudera.example.ClouderaImpalaJdbcExample

from the root of the project directory.  There is a `run-with-maven.sh` script included in this project.

####Sample output
Here is sample output from running the example:

	$ ./run-with-maven.sh 
	[INFO] Scanning for projects...
	[INFO]                                                                         
	[INFO] ------------------------------------------------------------------------
	[INFO] Building cloudera-impala-jdbc-example 1.0
	[INFO] ------------------------------------------------------------------------
	[INFO] 
	[INFO] >>> exec-maven-plugin:1.2.1:java (default-cli) > validate @ cloudera-impala-jdbc-example >>>
	[INFO] 
	[INFO] <<< exec-maven-plugin:1.2.1:java (default-cli) < validate @ cloudera-impala-jdbc-example <<<
	[INFO] 
	[INFO] --- exec-maven-plugin:1.2.1:java (default-cli) @ cloudera-impala-jdbc-example ---

	=============================================
	Cloudera Impala JDBC Example
	Using Connection URL: jdbc:hive2://mbrooks0:21050/;auth=noSasl
	Running Query: SELECT description FROM sample_07 limit 10
	
	== Begin Query Results ======================
	All Occupations
	Management occupations
	Chief executives
	General and operations managers
	Legislators
	Advertising and promotions managers
	Marketing managers
	Sales managers
	Public relations managers
	Administrative services managers
	== End Query Results =======================
	
	
	[INFO] ------------------------------------------------------------------------
	[INFO] BUILD SUCCESS
	[INFO] ------------------------------------------------------------------------
	[INFO] Total time: 3.716 s
	[INFO] Finished at: 2014-08-07T23:23:43-07:00
	[INFO] Final Memory: 16M/225M
	[INFO] ------------------------------------------------------------------------

	
	

####Running the example outside of maven
To run this example outside of maven, add all of the jars that correspond to the dependencies referenced in this project's pom to the classpath.  There is an example `run.sh` script included in this project that provides an example of how to set the classpath.  Edit the script so the paths are correct on your system.

Here are the relevant paths for jars to add to the classpath, using the default locations for Cloudera Impala included in CDH 5.1.0 installed via [parcels](http://blog.cloudera.com/blog/2013/05/faq-understanding-the-parcel-binary-distribution-format/):

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

And here is the output from running the example outside of maven:

	$ ./run.sh 
	
	=============================================
	Cloudera Impala JDBC Example
	Using Connection URL: jdbc:hive2://mbrooks0:21050/;auth=noSasl
	Running Query: SELECT description FROM sample_07 limit 10
	
	== Begin Query Results ======================
	All Occupations
	Management occupations
	Chief executives
	General and operations managers
	Legislators
	Advertising and promotions managers
	Marketing managers
	Sales managers
	Public relations managers
	Administrative services managers
	== End Query Results =======================


