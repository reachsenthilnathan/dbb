#!/bin/sh

##############################################################################################
#
# This script calls the GenerateBuildScripts.groovy and uses the supplied configuration to
# find the dbb.xml file previously generated by gendbbxml.sh. From the dbb.xml, it will use
# the script template and script template converter groovy to generate a groovy script 
# representing your JCL. Depending on the complexities of your JCL, some modifications to the
# generated groovy may be required.
# 
##############################################################################################
scriptDir=$(dirname $0)
if [[ -z "${DBB_HOME}" ]]; then
  echo "Need to specified the required environment variable 'DBB_HOME'"
  exit 8
fi

CMD="$DBB_HOME/bin/groovyz $scriptDir/../groovy/GenerateBuildScripts.groovy $@"

$CMD
rc=$?; if [[ $rc != 0 ]]; then exit $rc; fi
