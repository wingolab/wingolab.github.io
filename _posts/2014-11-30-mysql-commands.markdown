---
layout: post
title: "mysql commands"
date: "2014-11-30"
---

### use database

    USE sampdb;
    SELECT DATABASE();

### create table in database

    CREATE TABLE tbl_name (column_specs);

## Explore the data

    SHOW DATABASES;
    SHOW TABLES;

### describe a table

    DESCRIBE tbl_name;
    SHOW COLUMNS FROM tbl_name;

## Adding data

### Adding data in mysql client from `insert_data.sql` file

    source insert_data.sql;

### Adding data from command line from `insert_data.sql` file

    mysql testdb < insert_data.sql

### Adding data in mysql client using a text file `member.txt`

    LOAD DATA LOCAL INFILE 'member.txt' INTO TABLE member;

## Retrieving data

### selecting data

    SELECT what to retrieve FROM table or tables WHERE conditions that data must satisfy;

### concatenating data

In the following snippet, the `AS` is optional. `CONCAT` just concatenates some columns together into a more convenant form.

    SELECT CONCAT(first_name,' ',last_name) AS 'Full Name',
    CONCAT(city,', ',state) AS 'current city',
    FROM member;

## dates

Dates are always in the form `YYYY-MM-DD`.

### calculate date differences

    SELECT last_name, first_name, expiration FROM member
    WHERE (TO_DAYS(expiration) - TO_DAYS(CURDATE())) < 60;

Alternatively:

    SELECT last_name, first_name, expiration FROM member
    WHERE TIMESTAMPDIFF(DAY, CURDATE(), expiration) < 60;

### calculate one date from another

Use `DATE_ADD()` or `DATE_SUB()` like this:

    SELECT DATE_ADD('1970-1-1', INTERVAL 10 YEAR);

## Pattern matching

use `%` to match stuff.

## Summarizing data

Use `SELECT DISTINCT state FROM member order by state` to tally up the states your members are from.

Use `SELECT COUNT(*) FROM member` to count the number of rows that were selected by your query. You could thow a `WHERE` clause to determine how many rows the clause matches.

To get a summary of the summary from `COUNT(*)` add the `WITH ROLLUP` clause.

## Joining multiple tables

### Inner Join

Simply joins the intersection of the 2 or more tables.

### Left/Right Join

Joins using either the left or right table as the reference table such that values present in that values present in that table will always be given even if they may not have any results.

### Join - same column in 2 different tables

When joining tables with the same name mysql will return the names of both columns (and their contents), but problems arise when you're trying to have them returned as an hashref since they will end up having the same name in the resultant table. To get around this use the 'AS' command to create an alias for one or more of the columns.

    SELECT a.name, b.name AS name2 FROM a INNER JOIN b WHERE a.name = b.name


## Perl DBI Notes

### DBI hashref

Force the hashref from a DBI query to give the keys, which are column names, as either upper or lower case.

    $hash_ref = $sth->fetchrow_hashref ("NAME_lc"); # use lowercase names
    $hash_ref = $sth->fetchrow_hashref ("NAME_uc"); # use uppercase names

### DBI fetchall_arrayref()

    my $array_ref = $sth->fetchall_arrayref ();

This places all of the results from a query into one large array, which you can access like `$array_ref->[$i][$j]`. It will return a reference to an empty array if the set is empty.

### DBI selectall_arrayref()

    my $array_ref = $dbh->selectall_arrayref($statement);

`selectall_arrayref()` will perform the prepare(), execute(), and fetch loop for you. It returns an array reference like `$array_ref->[$i][$j]`.

### DBI NULL vs zero vs "" (i.e., empty string)

Check that the value is not defined first then you can determine if it's a string or zero or has some value.

    if (!defined($val)) { $val = "NULL"; }
    elsif ($val eq "")  { $val = "Empty String"; }
    elsif ($val == 0)   { $val = 0; }
    else                { print "do something"; }

### DBI an quoting characters

Quoting within strings leads to annoying problems sometimes. One solution is to use `qq{ }` to place the string inside quotation markers without the need to escape all of the single or double quotes you might need to write.

Quoting strings with a single or double quote is necessary if you want to insert them with `$dbh->quote()` into mysql. For example,

Wrong:

    $airport_name = "O'Hare";
    $row = $dbh->do(qq{
      INSERT INTO airport (airport_name)
      VALUES '$airport_name'
      });

Right:

    $airport_name = $dbh->quote("O'Hare");
    $row = $dbh->do(qq{
      INSERT INTO airport (airport_name)
      VALUES $airport_name
      });

### DBI prepare and placeholder values

When inserting a lot of things as in a loop situation, it's more efficient to use prepare within the loop like so.

    $dbh->do( qq{ DELETE FROM airport }) # delete existing rows
    my $sth = $dbh->prepare( qq{ INSERT INTO airport SET name = ?});
    while(<>)
    {
      chomp;
      $sth->execute($_); # dumps each line into the table as a new row
    }

To specify each value separately try this:

    my $sth = $dbh->prepare( qq{ INSERT INTO airport airport_name airport_city airport_state VALUES(?, ?, ?)});
    while(<>)
    {
      chomp;
      my ($name, $city, $state) = split(/\t/, $_);
      $sth->execute($name, $city, $state);
    }


### DBI bind query results to variables

Use `$sth->bind_columns()` to bind results of queries to a variable in perl.

    my ($airport_name, $airport_city, $airport_state);
    my $sth = $dbh->prepare ( qq{
                    SELECT name, city, state
                    FROM airport ORDER BY airport_name
                  });
    $sth->execute();
    $sth->bind_columns(\$airport_name, \$airport_city, \$airport_state);
    while ($sth->fetch)
    {
      print join("\t", $airport_name, $airport_city, $airport_state)
    }

### DBI connection to a database

    my $dsn = "DBI:mysql:db_name:host_name";
    my $dbh = DBI->connect($dsn, $username, $password);

Alternatively, you can use a file.

    my $dsn = "DBI:mysql:db_name;mysql_read_default_file=/home/User/.my.cnf";

Or,

    my $dsn = "DBI:mysql:db_name;mysql_read_default_file=$ENV{HOME}/.my.cnf";

Then `.my.cnf` would have the following information.

    [client]
    host=localhost
    user=sampadm
    password=secret

To make things specific to a particular database use `mysql_read_default_group` **provided** that the database is listed in some common place like `/etc/my.cnf` and specify the database (i.e., groupe). For example,

    my $dsn = "DBI:mysql:db_name;mysql_read_default_group=client";

This will only read the `[client]` section of the file.

#### DBI connection to a database boilerplate

Taken from MySQL, 5th Ed. by Paul DuBois, `Print ISBN-13: 978-0-321-83387-7`.

    #!/usr/bin/perl

    use strict;
    use warnings;
    use DBI;

    # parse connection parameters from command line if given

    use Getopt::Long;
    $Getopt::Long::ignorecase = 0; # options are case sensitive
    $Getopt::Long::bundling = 1;   # -uname = -u name, not -u -n -a -m -e

    # default parameters - all undefined initially
    my ($host_name, $password, $port_num, $socket_name, $user_name);

    GetOptions (
      # =i means an integer value is required after option
      # =s means a string value is required after option
      "host|h=s"      => \$host_name,
      "password|p=s"  => \$password,
      "port|P=i"      => \$port_num,
      "socket|S=s"    => \$socket_name,
      "user|u=s"      => \$user_name
      ) or exit (1);

      # construct data source
      my $dsn = "DBI:mysql:sampdb";
      $dsn .= ";host=$host_name" if $host_name;
      $dsn .= ";port=$port_num" if $port_num;
      $dsn .= ";mysql_socket=$socket_name" if $socket_name;
      $dsn .= ";mysql_read_default_group=client";

      # connect to server
      my %conn_attrs = (RaiseError => 1, PrintError => 0, AutoCommit => 1);
      my $dbh = DBI->connect ($dsn, $user_name, $password, \%conn_attrs);

### DBI tracing

There are 4 levels of tracing with `DBI->trace(0)` having no tracing. You can turn on tracing a couple of ways. In the script, after preparing the statement do this, `$sth->trace(1)`. Alternatively, when you connect turn it on with ``$dbh->{Tracelevel} = 3`. Finally, you can set an environmental variable in the shell, e.g., `export DBI_TRACE=3` and to turn it off `export DBI_TRACE=0`.

### DBI meta data.

`$sth->{NUM_OF_FIELDS}` is a scalar and `$sth->{mysql_max_length}` and `$sth->{NAME}` are arrayrefs. They can be used to help format the output as with this example.

    my @max_col_width = @{ $sth->{mysql_max_length}};
    my $column_count  = $sth->{NUM_OF_FIELDS};
    foreach my $i (0..$column_count)
    {
      my $col_name = $sth->{NAME}->[$i];
      my $col_name_width = length $col_name;
      $max_col_width[$i] = $col_name_width if $max_col_width[$i] < $col_name_width;
      $max_col_width[$i] = 4 if $sth->{NULLABLE}->[$i] && $max_col_width[$i] < 4;
    }
