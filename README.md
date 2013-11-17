# Twiddle Standalone

This is a standalone version of the CLI based JMX tool Twiddle by JBoss.

The original Twiddle is a simple but powerful CLI based JMX client often used by e g system administrators to retrieve various JMX data for use in shell scripting.  
It is normally bundled with JBoss AS up to community version 6.  

As Twiddle - or similar tool - was missing from the JBoss AS7 / WildFly distributions, the need for this type of tool has been in high demand.
To remedy this, twiddle-standalone was born.

twiddle-standalone has initially been created by re-packaging the twiddle script (twiddle.sh with some modifications) and required JARs from JBoss AS 6.1.0.Final.  
See also JSR-160. 

To make twiddle-standalone work for JBossAS7/WildFly - that utilizes the remoting-jmx protocol for external retrieval of JMX vlies - various new modules (JARs) has been linked in.
As these modules vary somewhat between JBossAS7/WildFly distributions, they are currently not part of the twiddle-standalone distribution itself.

## Prerequisites

Some JAR:s of JBoss AS7 or WildFly are needed for the rmoting-jmx protocol to work, so an installation of JBoss AS7 or WildFly is recommeded for eeasy setup of twiddle-standalone.
Alternatively, look in $TWIDDLE_HOME/bin/twiddle.sh for the JAR:s needed - they are listed by the MODULES variable - and add them to a location of more convenience to you particular environment.

## Usage

### Set JBOSS_HOME

First set an evironment variable JBOSS_HOME to the root of your JBossAS7/WildFly installation, in your shell or the twiddle.sh script itself.. E g

	export JBOSS_HOME=/opt/wildfly-8.0.0.Beta1

### Execute

All old twiddle commands should work as before.

Try running twiddle-standalone by executing

	twiddle.sh -h

from $TWIDDLE_HOME/bin.

To access and retrieve values from an JBossAS7/Wildfly instance you need to specify the remoting-jmx protocol, like

	twiddle.sh -s service:jmx:remoting-jmx://127.0.0.1:9999 get java.lang:type=ClassLoading

which (with WildFly 8.0.0.Beta1) would give an output of something like

	12:18:21,150 INFO  [xnio] XNIO version 3.1.0.CR7
	12:18:21,173 INFO  [nio] XNIO NIO Implementation Version 3.1.0.CR7
	12:18:21,212 INFO  [remoting] JBoss Remoting version 4.0.0.Beta1
	TotalLoadedClassCount=7685
	Verbose=false
	LoadedClassCount=7685
	UnloadedClassCount=0
	ObjectName=java.lang:type=ClassLoading

## Compitability

This version of twiddle-standalone has successfully (and unaltered)  been tested on
OS X 10.9 with Java SE 7 (1.7.0_45) and JBossAS/WildFly  7.2.0 and Wildfly 8.0.0.Beta1
