Twiddle Standalone

This is a standalone version of the CLI based JMX tool Twiddle by JBoss.

The original Twiddle is a simple but poweful CLI based JMX client often used by e g system administrators to retrieve various JMX data by shell scripting. 
It is normally bundled with JBoss AS up to community version 6.
For AS 7 no equivalent tool exist or is planned by JBoss (in time of writing and AFAIK).
To patch this hole, twiddle-standalone has been created.
twiddle-setandalone has initially been created by re-packaging the twiddle script (twiddle.sh with some modifiations) and required JARs from JBoss AS 6.1.0.Final 
See also JSR-160

Usage

Set an evironment variable TWIDDLE_HOME to the root of the twiddle-standalone directory. E g 
export TWIDDLE_HOME=/opt/twiddle-standalone

Run twiddle as usual. E g
$TWIDDLE_HOME/bin/twiddle.sh -h

Optionally, add $TWIDDLE_HOME/bin to you PATH environment variable.
export PATH=$PATH:$TWIDDLE_HOME/bin

Then you can run twiddle directly, e g
twiddle.sh -h

