---

layout: post
title: "Oracle SQL notes"
date: "2017-06-17"
---

# connecting on OS X / Linux 

This is not trivial on OS X. I used this [guide](http://apextips.blogspot.com/2015/09/making-connections-to-oracle-database.html)
as a starting place and the documentation for 
[sqlplus](https://docs.oracle.com/cd/B19306_01/server.102/b14357/ch12015.htm).

## Driver Setup

Install the oracle client and SDK. For linux Ubuntu provides instructions 
[here](https://help.ubuntu.com/community/Oracle%20Instant%20Client). For OS X, 
the procedure is similar. First, download the oracle client 
[here](http://www.oracle.com/technetwork/database/features/instant-client/index-097480.html). 
You want the client, the SDK, and sqlplus. Next, unzip the client (e.g., 
`client_12`) and unzip SDK into the client folder (e.g., `client_12\sdx`). 

Here are the files I downloaded circa 2017:

```
instantclient-basiclite-macos.x64-12.1.0.2.0.zip
instantclient-sdk-macos.x64-12.1.0.2.0.zip
instantclient-sqlplus-macos.x64-12.1.0.2.0.zip
```

Here is how I unzipped those files and moved them to their new home, 
`${LOC_SYS}/oracle`.

```
mkdir ${LOC_SYS}/oracle

unzip instantclient-basiclite-macos.x64-12.1.0.2.0.zip
mv instantclient_12_1/* ${LOC_SYS}/oracle
rmdir instantclient_12_1/

unzip instantclient-sqlplus-macos.x64-12.1.0.2.0.zip
mv instantclient_12_1/* ${LOC_SYS}/oracle
rmdir instantclient_12_1/

unzip instantclient-sdk-macos.x64-12.1.0.2.0.zip
mv instantclient_12_1/* ${LOC_SYS}/oracle
rmdir instantclient_12_1/
```

I add the oracle libraries to `${LOC_SYS}/lib`, but I do not think this is 
needed.

```{bash}
cd ${LOC_SYS}/lib
ln -sv ../oracle/*dylib* .
```

To install the golang driver you will need to create a `oci8.pc` for 
pkg-config. Place the final file here: `${LOC_SYS}/lib/pkgconfig/oci8.pc`

`oci8.pc` contents:

```
prefix=${LOC_SYS}/oracle
exec_prefix=${prefix}
libdir=${exec_prefix}
includedir=${prefix}/sdk/include

Name: oci8
Description: oci8 library
Cflags: -I${includedir}
Libs: -L${libdir} -lclntsh
Version: 12.1

```

Add oracle files to the path and create an environmental variable `$ORACLE_HOME`

```{bash}
export PATH=${PATH}:${LOC_SYS}/oracle
export ORACLE_HOME=${LOC_SYS}/oracle
```

Finally, we need to update the host file.

Edit the hosts file (`/etc/hosts`) to include local computer name by adding the 
computer name to the end of the 127.0.0.1 line. Use `hostname` to get the name
of your computer. The final hosts file will look like:

```
127.0.0.1 localhost <local computer name>
```

## Install perl DBD::Oracle

I could only make a manual solution work. Download and untar DBD::Oracle and install as per usual:

```
perl Makefile.PL
make
```

Now, update `blib/arch/auto/DBD/Oracle/Oracle.bundle` with the right path to the library.

```
otool -L blib/arch/auto/DBD/Oracle/Oracle.bundle
# here's what it should look at this step
#blib/arch/auto/DBD/Oracle/Oracle.bundle:
#	@rpath/libclntsh.dylib.12.1 (compatibility version 0.0.0, current version 0.0.0)
#	/usr/lib/libSystem.B.dylib (compatibility version 1.0.0, current version 1226.10.1)
#	/usr/lib/libgcc_s.1.dylib (compatibility version 1.0.0, current version 915.0.0)

install_name_tool -change @rpath/libclntsh.dylib.12.1 /Users/twingo/local/oracle/libclntsh.dylib.12.1 blib/arch/auto/DBD/Oracle/Oracle.bundle

otool -L blib/arch/auto/DBD/Oracle/Oracle.bundle
# here's what it should look like now
#blib/arch/auto/DBD/Oracle/Oracle.bundle:
#	/Users/twingo/local/oracle/libclntsh.dylib.12.1 (compatibility version 0.0.0, current version 0.0.0)
#	/usr/lib/libSystem.B.dylib (compatibility version 1.0.0, current version 1226.10.1)
#	/usr/lib/libgcc_s.1.dylib (compatibility version 1.0.0, current version 915.0.0)

make test
```

The perl library seems to look for the TNS file `tnsnames.ora` in 
`${ORACLE_HOME}/network/admin`.

# Connecting

The commandline tool is `sqlplus`. For connections that exist in your 
`tnsnames.ora` file which is located on your $HOME directory by default, 
connect to those hosts with `sqlplus <USERNAME>@<DATABASE>`. The default is 
sqlplus `username/password@address:port/service_name`.
