# Jelastic PostgreSQL Database Replication Installation Package 

This repository provides [PostgreSQL Database Replication](http://docs.jelastic.com/postgresql-database-replication/) JPS-based installation package for Jelastic Platform.


**PostgreSQL Database Replication** is used to solve performance problems, to support the db backups, and to alleviate system failures. It enables data from one database server (master) to be replicated to another (slave).

**Engine**: java7

**Environment topology**:

1. 
   - node type: postgres9
   - count: 2
   - cloudlets: 16


### What it can be used for? (i.e. usecases + description of options to define if are any)
Get advantages of PostgreSQL database clustering and high availability by setting up the hot standby (or streaming) replication, i.e. asynchronous binary replication to one or more standbys, queried as a read-only databases.<br />
Using WAL (Write-Ahead Logging) data is the fastest available way of replication with a great performance, so-called asynchronous replication. In this case the master database server works in archiving mode just writing the data to the storage.<br />
While the standby database cluster operates in recovery mode, reading the master's WAL files. These files are transferred to the standby DB promptly after writing is completed. In such a way, if master server totally fails, the WAL content streams to the standby cluster with just a few seconds delay.


### What Jelastic JPS package is?

Jelastic JPS package represents an one-click installation solution, that allows to get the desired project hosted at Jelastic Cloud in a matter of minutes. Being based on [Jelastic Packaging Standard](https://docs.jelastic.com/jps), it automates creation of the necessary environment and subsequent application deployment to it. Herewith, all of the required properties and behaviors are predefined within the package JSON manifest, so you instantly get the ready-to-go solution.
The full list of the available at a platform one-click packages can be seen at the corresponding same-named section of [Jelastic Marketplace](https://docs.jelastic.com/marketplace#apps].

### How to deploy a package?
###### For Developers

In case you can’t find the desired solution within the list of available ones at your dashboard, just copy and save the content of its manifest as a *.json* file and [import](https://docs.jelastic.com/environment-export-import#import) it to the dashboard. Herewith, you can apply any necessary adjustments to template settings through this file (if such are required) and install its customized version in the similar way.

###### For Cluster Admins

In order to add the desired JPS package to your platform and make it available for users, perform the following:
- copy content of its manifest 
- switch to the [Marketplace](http://ops-docs.jelastic.com/marketplace-46) section of your JCA panel and choose **Add > New Installation** menu option
- paste the copied strings into the appeared frame and **Save** the template
- choose your newly added package within the list and click on **Publish** above

Also, you are able to adjust the given package template according to your needs and provide its customized version.