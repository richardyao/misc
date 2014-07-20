JAVA_HOME=/home/richard/studyspace/hadoop/jdk1.7.0_65
CLASSPATH=/home/richard/studyspace/hadoop/hadoop-2.4.1/etc/hadoop:/home/richard/studyspace/hadoop/hadoop-2.4.1/share/hadoop/common/lib/*:/home/richard/studyspace/hadoop/hadoop-2.4.1/share/hadoop/common/*:/home/richard/studyspace/hadoop/hadoop-2.4.1/share/hadoop/hdfs:/home/richard/studyspace/hadoop/hadoop-2.4.1/share/hadoop/hdfs/lib/*:/home/richard/studyspace/hadoop/hadoop-2.4.1/share/hadoop/hdfs/*:/home/richard/studyspace/hadoop/hadoop-2.4.1/share/hadoop/yarn/lib/*:/home/richard/studyspace/hadoop/hadoop-2.4.1/share/hadoop/yarn/*:/home/richard/studyspace/hadoop/hadoop-2.4.1/share/hadoop/mapreduce/lib/*:/home/richard/studyspace/hadoop/hadoop-2.4.1/share/hadoop/mapreduce/*:/contrib/capacity-scheduler/*.jar

all: ListStatus.jar

ListStatus.jar: ListStatus.class
	${JAVA_HOME}/bin/jar cvf ListStatus.jar ListStatus.class

ListStatus.class: ListStatus.java
	${JAVA_HOME}/bin/javac -classpath ${CLASSPATH}  ListStatus.java

clean:
	rm -f *.class
	rm -f *.jar
