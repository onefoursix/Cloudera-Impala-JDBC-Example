Cloudera Impala JDBC Example
============================

This example shows how to build and run a maven-based project that executes SQL queries on Cloudera Impala using JDBC. 
Cloudera Impala is a native Massive Parallel Processing (MPP) query engine which enables users to perform interactive analysis of data stored in HBase or HDFS. 

Here are links to more information on Cloudera Impala:

- [Cloudera Enterprise RTQ](http://www.cloudera.com/content/cloudera/en/products/cloudera-enterprise-core/cloudera-enterprise-RTQ.html) 

- [Cloudera Impala Documentation](http://www.cloudera.com/content/support/en/documentation/cloudera-impala/cloudera-impala-documentation-v1-latest.html)

- [Cloudera Impala JDBC Documentation](http://www.cloudera.com/content/cloudera-content/cloudera-docs/Impala/latest/Installing-and-Using-Impala/ciiu_impala_jdbc.html)

- [Impala-User Google Group](https://groups.google.com/a/cloudera.org/forum/?fromgroups#!forum/impala-user)

 
 
To use the Cloudera Impala JDBC driver in your own maven-based project you can copy the `<dependency>` and `<repository>` elements from this project's pom to your own instead of manually downloading the JDBC driver jars.




###Dependencies
To build the project you must have Maven 2.x or higher installed.  Maven info is [here](http://maven.apache.org).

To run the project you must have access to a Hadoop cluster running Cloudera Impala with at least one populated table defined in the Hive Metastore.


###Configure the example
To configure the example you must do three things:

- Select or create the table(s) to query against.
- Set the query in the example source file
- Set the impalad host in the example source file

These steps are described in more detail here:





Select a table to run the example with
For this example I will use one of the Hue Beeswax sample tables.  I can see the tables using [Hue](http://gethue.com) as in the screenshot below:  


![Hue Table List](images/HueTableList.jpg)

###Configure the project
Edit these two setting int the ClouderaImpalaJdbcExample source file:

- Set the SQL Statement

`private static final String SQL_STATEMENT = "SELECT description FROM sample_07 limit 10";`
	
- Set the host for the impalad you want to connect to: 

`private static final String IMPALAD_HOST = "MyImpaladHost";`


###Building the project
Run the command `mvn clean compile`.   There is a build.sh script for your convenience.

###Running the example
To run the example
