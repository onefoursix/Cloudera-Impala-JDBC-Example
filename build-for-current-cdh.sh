#!/bin/bash

# Abort in case of errors
set -e

# Globals
readonly BASE_DIR=$( readlink -f $( dirname $0 )/.. )
readonly CDH_HOME=/opt/cloudera/parcels/CDH
readonly HIVE_LIB_DIR=$CDH_HOME/lib/hive/lib
readonly HADOOP_LIB_DIR=$CDH_HOME/lib/hadoop

readonly CDH_VERSION=$( readlink -f $CDH_HOME | sed 's/^[^-]*-\([^-]*\)-.*/\1/' )

function get_version {
  local dir=$1
  local prefix=$2

  echo $( find $dir -name "$prefix*.jar" | tail -1 | sed "s/^.*\/$prefix//" | sed 's/\.jar//' )
}

function build {
  local cdh_hive_version=$( get_version $HIVE_LIB_DIR hive-common- )
  local cdh_hadoop_version=$( get_version $HADOOP_LIB_DIR hadoop-common- )
  echo "Building for:"
  echo "  CDH    = $CDH_VERSION"
  echo "  Hive   = $cdh_hive_version"
  echo "  Hadoop = $cdh_hadoop_version"
  mvn clean package \
    -Dcdh5.hive.version=$cdh5_hive_version \
    -Dcdh5.hadoop.version=$cdh5_hadoop_version \
    -DskipTests
}

function main() {
  # Build 
  build

  echo "Done!"
}

### MAIN ###
main
