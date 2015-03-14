---
layout: post
title: "Oracle SQL commands"
date: "2015-03-14"
---

# oracle SQL

Instead of having `show dbs` like mysql you need to use the system-level
metadata to figure out schema names, tables, and what you can access. The tables
that are of most help are `ALL_TABLES`, `ALL_USERS`, `ALL_VIEWS`, `ALL_OBJECTS`,
`ALL_TRIGGERS`, and `ALL_INDEXES`. All of these are prefixed by `SYS`. Here are
a few examples of how to use these tables taken from
[this post](http://www.razorsql.com/articles/oracle_system_queries.html).

I'm, of course, not an oracle DBA or anything approaching a sophisticated user.
I only note that when oracle users speak of `schemas` and `users` these terms
seem to have some equivalency.

## tables

List all of the tables you can view.

    select TABLE_NAME, OWNER from SYS.ALL_TABLES order by OWNER, TABLE_NAMES;

Add `where OWNER = 'some_schema'` if desired.

## views

    select VIEW_NAME, OWNER from SYS.ALL_VIEWS order by OWNER, VIEW_NAME;

Add `where OWNER = 'some_schema'`
