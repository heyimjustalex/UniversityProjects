# RMI_examples
A complete client/server example that uses RMI's capabilities to load and to execute user-defined tasks at runtime. The server in the example implements a generic compute engine, which the client uses to compute the value of PI.<br/>
The configuration settings in the scripts corresponds to the network topology shown below.
![network topology](/topology.png)
<br/>
## Support for for cross-compilation
The Java 9 compiler introduced a new command-line option, --release. This option automatically configures the compiler to produce class files that will link against an implementation of the given platform version. For the platforms predefined in javac, --release N is equivalent to -source N -target N -bootclasspath <bootclasspath-from-N>.