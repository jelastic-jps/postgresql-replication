[![PostgreSQL Database Replication](images/postgres9_logo.png)](../../../postgresql-replication)
## PostgreSQL Database Replication

The JPS package deploys PostgreSQL Cluster with preconfigured replication that initially contains 2 database containers. The package provides the solution for solving performance problems, DB backups support, gives ability to alleviate system failures. It enables data from one database server (the master) to be replicated to another standby (the slave).

### Highlights
This package is designed to solve a number of different problems with performance, supporting the backup of different databases, and as a part of a larger solution to alleviate system failures.<br />

Get advantages of PostgreSQL database clustering and high availability by setting up the hot standby (or streaming) replication, i.e. asynchronous binary replication to one or more standbys, queried as a read-only databases.<br />
Using WAL (Write-Ahead Logging) data is the fastest available way of replication with a great performance, so-called asynchronous replication. In this case the master database server works in archiving mode just writing the data to the storage.<br />
While the standby database cluster operates in recovery mode, reading the master's WAL files. These files are transferred to the standby DB promptly after writing is completed. In such a way, if master server totally fails, the WAL content streams to the standby cluster with just a few seconds delay.<br />

The target usage for replication in PostgreSQL databases includes:
  -  Data security
  -  Analytics
  -  Long-distance data distribution

###Environment Topology

![MySQL Database Replication Topology](https://docs.google.com/drawings/d/1B4N1oR9ft5YrP6jPVApzHCYsTOD-u_3X1CAQD-b6rJk/pub?w=557&h=275)

### Specifics

Layer              |     Server    | Number of CTs <br/> by default | Cloudlets per CT <br/> (reserved/dynamic) | Options
----------------- | --------------| :-----------------------------------------: | :-------------------------------------------------------: | :-----:
DB                  |    PostgreSQL    |       2                                             |           1 / 16                                                       | -

* DB - Database 
* CT - Container

**PostgreSQL Database**: 9.5.2<br/>
**Java Engine**: Java 7.0

### Deployment

In order to get this solution instantly deployed, click the "Get It Hosted Now" button, specify your email address within the widget, choose one of the [Jelastic Public Cloud providers](https://jelastic.cloud) and press Install.

[![GET IT HOSTED](https://raw.githubusercontent.com/jelastic-jps/jpswiki/master/images/getithosted.png)](https://jelastic.com/install-application/?manifest=https%3A%2F%2Fgithub.com%2Fjelastic-jps%2Fpostgresql-replication%2Fraw%2Fmaster%2Fmanifest.jps)

To deploy this package to Jelastic Private Cloud, import [this JPS manifest](../../raw/master/manifest.jps) within your dashboard ([detailed instruction](https://docs.jelastic.com/environment-export-import#import)).

More information about Jelastic JPS package and about installation widget for your website can be found in the [Jelastic JPS Application Package](https://github.com/jelastic-jps/jpswiki/wiki/Jelastic-JPS-Application-Package) reference.
