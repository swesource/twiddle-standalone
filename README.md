# Twiddle Standalone

This is a standalone version of the CLI based JMX tool Twiddle by JBoss.

The original Twiddle is a simple but powerful CLI based JMX client often used by e g system administrators to retrieve various JMX data for use in shell scripting. 
It is normally bundled with JBoss AS up to community version 6.
For AS 7 no equivalent tool exist or is planned by JBoss (in time of writing and AFAIK).
To patch this hole, twiddle-standalone has been created.
twiddle-standalone has initially been created by re-packaging the twiddle script (twiddle.sh with some modifications) and required JARs from JBoss AS 6.1.0.Final 
See also JSR-160.

## Usage

Set an environment variable TWIDDLE_HOME to the root of the twiddle-standalone directory. E g 
    export TWIDDLE_HOME=/opt/twiddle-standalone

Run twiddle as usual. E g
  $TWIDDLE_HOME/bin/twiddle.sh -h

Optionally, add $TWIDDLE_HOME/bin to your PATH environment variable, e g
  export PATH=$PATH:$TWIDDLE_HOME/bin

...and then you can run twiddle directly, e g
   twiddle.sh -h

