#!/bin/bash
echo "Vagrant build scenario"

# output with some color and font weight
function drawtext() {
	tput $1
	tput setaf $2
	echo -n $3
	tput sgr0
}

# Variables
FILENAME="vars.sh"

# JAVA
JHOME_VAR="JAVA_HOME"
JHOME_VALUE="/usr/java/jdk1.8.0_161"

# MAVEN
MHOME_VAR="MAVEN_HOME"
MHOME_VALUE="/usr/java/apache-maven-3.5.2"

# FOLDER
FILEFOLDER="etc"

# Create new file with environmental variables
echo "Creating scenario file: $(drawtext bold 2 ${FILENAME})"
touch ${FILENAME}

# Writting lines to the file
echo "Writting scenario to the file ${FILENAME}"
echo "Writting $(drawtext bold 2 ${JHOME_VAR}) variable"
echo  "${JHOME_VAR}=${JHOME_VALUE}" > ${FILENAME}

echo "Writting $(drawtext bold 2 ${MHOME_VAR}) variable"
echo  "${MHOME_VAR}=${MHOME_VALUE}" >> ${FILENAME}

# Add maven bin folder to the PATH environmental variable
echo "Changing $(drawtext bold 2 "PATH") variable"
echo "PATH=$PATH:${MHOME_VALUE}/bin" >> ${FILENAME}

# Copying file with variables to the specific folder
echo "Moving file $(drawtext bold 2 ${FILENAME}) to the $(drawtext bold 2 $FILEFOLDER)"
mv ${FILENAME} $FILEFOLDER/${FILENAME}

echo "$(drawtext bold 2 "Everything is OK")"