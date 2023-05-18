# Constraints, Combining sets and Relationships 🧦

## Queries with multiple statements

An SQL query can have only one statement. That means we can just SELECT from a table and get some result. Or we can DELETE all data in a table as well, and we would still be executing one statement. But we can also chain statements to create complex queries to the database. We can do this by writing a statement and after it writes, we do another one by just leaving a space character between them. These statements always follow a certain order, and we can't put them any way we see fit. A good example would be the SELECT statement. We can write a SELECT statement to get all the records from a table and then we can write a statement that filters through them and then chain another one that orders them by some parameter. The final result will show up as a filtered and ordered table of the records from the table we executed the query on. 

### SQL Order of Execution

When writing queries with multiple statements, it is important to know what SQL does in the background with all of our statements. This table shows how the clauses of a query with multiple statements are executed in the background one by one, in order.

> Note: This is not the ORDER in which the clauses are WRITTEN. It's the ORDER in which the clauses are EXECUTED.

| **Order** | **Clause** | **Function**                            |
|-----------|------------|-----------------------------------------|
| 1         | FROM       | Choose and join tables to get base data |
| 2         | WHERE      | Filters the base data                   |
| 3         | GROUP BY   | Aggregates the base data                |
| 4         | HAVING     | Filters the aggregated data             |
| 5         | SELECT     | Returns the final data                  |
| 6         | ORDER BY   | Sorts the final data                    |
| 7         | LIMIT      | Limits the returned data to a row count |

### SQL Comparison Operators

| **Operator** | **Description**  |
|--------------|------------------|
| =            | Equal            |
| <>           | Not equal        |
| >            | Greater          |
| <            | Lesser           |
| >=           | Greater or Equal |
| <=           | Lesser or Equal  |
| LIKE         | Pattern Match    |
| BETWEEN      | Between a range  |

## Filtering and Sorting Data

### Where

This statement filters through a table. The result is a table result with the records that pass the Where statement.

```sql
/* Find all Bobs */
SELECT * FROM Students
WHERE FirstName = 'Bob';

/* Find all older than 24 */
SELECT * FROM Students
WHERE Age > 24;

/* Find all between the age of 30 and 40 */
SELECT * FROM Students
WHERE Age BETWEEN 30 AND 40;

/* Find all with the last name starting with the letter "b" */
SELECT * FROM Students
WHERE LastName LIKE 'b%';

/* Find all with last names ending with "y" */
SELECT * FROM Students
WHERE LastName LIKE '%y';

/* Find all with the first name that contains anywhere the letters "il" */
SELECT * FROM Students
WHERE FirstName LIKE '%il%';
```

### Order By

In SQL we can get a result and also order it by a certain column. This is done with the Order By statement. We can order by ascending or descending. This statement automatically checks for the type of the column and orders accordingly. The default state of Order By is always by Ascending, so telling the statement to order by Ascending can be left out.

```sql
/* Order all students by First Name in Ascending order*/
SELECT * FROM Students
ORDER BY FirstName;

SELECT * FROM Students
ORDER BY FirstName ASC;

/* Order all students by Last Name in Descending order*/
SELECT * FROM Students
ORDER BY LastName DESC;

/* Order all students by First Name in Ascending order, and if there are duplicate First Names, order them by Last Name in Ascending order */
/* If there are students with the same First and Last name, then order them by Age in Descending order */
SELECT * FROM Students
ORDER BY FirstName, LastName, Age DESC;
```

## Combining Sets

![Unions](../img/union.png)

### Union

This statement collects all UNIQUE values from two tables and it creates a result for all of them. So if you have 2 tables with a column with names, you can find all distinct names with this statement.

```sql
/* Find all unique cities from the Students and Trainers tables */
SELECT City FROM Students
UNION
SELECT City FROM Trainers

/* Find all unique first names from the Students and Trainers tables and orders them by Ascending */
SELECT FirstName FROM Students
UNION
SELECT FirstName FROM Trainers
ORDER BY FirstName;
```

### Union All

This statement is very similar to UNION, but it is not constrained only to unique values. With this statement, you will combine all values from 2 columns from different tables and if there are duplicates, they will show up in the result as well. So if you have 10 names in total from 2 table columns and out of those names, 3 people are named the same, you will get 3 duplicate names in the result.

```sql
/* Find all city records from the Students and Trainers tables */
SELECT City FROM Students
UNION ALL
SELECT City FROM Trainers

/* Find all first name records from the Students and Trainers tables and order them by Ascending */
SELECT FirstName FROM Students
UNION ALL
SELECT FirstName FROM Trainers
ORDER BY FirstName;
```

### Intersect

This statement combines all the values from columns out of tables and it returns a result of ONLY the values that exist in BOTH columns from both tables. This means that if a city exists in at least one record in both tables, it will show up in the result. If there is a city that does not exist in any record from one table or the other then it will not show up.

```sql
/* Find all unique and common city records from the Students and Trainers tables*/
SELECT City FROM Students
INTERSECT
SELECT City FROM Trainers

/* Find all unique and common first name records from the Students and Trainers tables and orders them by Ascending */
SELECT FirstName FROM Students
INTERSECT
SELECT FirstName FROM Trainers
ORDER BY FirstName;
```

## Table Constraints

### Default

The default constraint sets a default value for a certain column, and when a new record is created, if that column is left empty, the default value will populate the field.

```sql
/* When a new trainer record is added, and the city is left out, it will automatically add 'Skopje' instead of NULL */
ALTER TABLE Trainers 
ADD CONSTRAINT default_City
DEFAULT 'Skopje' FOR City;
```

### Check

This constraint checks for some logic on a certain column and will only allow the record to be written if the condition is met.

```sql
/* Checks if the age of a new record in the Students table has more than 18 years */
ALTER TABLE Students 
ADD CONSTRAINT CHECK_Person CHECK (Age >= 18)
```

### Unique

A constraint that makes sure that all records in a column are unique. This means that you can't write data that has values that are the same in that particular column with the unique constraint.

```sql
/* Checks if the age of a new record in the Students table has more than 18 years */
ALTER TABLE Students
ADD UNIQUE (StudentId);
```

### Not Null

The statement NOT NULL is self-explanatory. It makes the column in a table unable to hold null values. This means that when we insert or update a record, that column MUST have a value.

```sql
/* Makes the FirstName column unable to be null, and forces every record to have value */
ALTER TABLE Students
ALTER COLUMN FirstName nvarchar(255) NOT NULL;
```

## Key Constraints

### Primary keys

A primary key is the main unique identifier of a record in a table. Through IDs, we can be sure that we have precisely the record we need, as well as update and delete with certainty. Updating and deleting with ID always results in 1 record being changed. If some other column is used for these actions, it could result in the deletion of multiple records. For example, if we want to delete the student Bob, we would do it with Id. If we delete him by name, we would also delete ALL the other students that are named Bob as well. There can only be 1 primary key per table.

```sql
/* Creating a Students table, but indicating a PRIMARY KEY*/
CREATE TABLE Students (
    StudentId int NOT NULL PRIMARY KEY,
    FirstName nvarchar(255),
    LastName nvarchar(255),
    Age tinyint,
    City nvarchar(255)
);
```

### Foreign keys

Relational databases allow us to link tables and create relations between them if we need to. This linking of tables can be done by Foreign Keys. These keys hold a value ( Usually ID ) from another table and way we always know when records are connected to other records in different tables. We can have multiple foreign keys in one table.

```sql
/* Another table that represents a Group */
CREATE TABLE Groups (
    GroupId int NOT NULL PRIMARY KEY,
    Name nvarchar(255) NOT NULL,
    Academy nvarchar(255)
);

/* Creating a new column Group in Students and making that column a Foreign Key, binding it with the GroupId column in the Groups table */
ALTER TABLE Students
ADD GroupId int 
FOREIGN KEY (GroupId) REFERENCES Groups(GroupId);
```


### Extra Materials 📘

- [Microsoft Documentation](https://docs.microsoft.com/en-us/sql/t-sql/language-reference?view=sql-server-ver15)
  - [Where](https://docs.microsoft.com/en-us/sql/t-sql/queries/where-transact-sql?view=sql-server-ver15)
  - [Order By](https://docs.microsoft.com/en-us/sql/t-sql/queries/select-order-by-clause-transact-sql?view=sql-server-ver15)
  - [Union](https://docs.microsoft.com/en-us/sql/t-sql/language-elements/set-operators-union-transact-sql?view=sql-server-ver15)
  - [Intersect](https://docs.microsoft.com/en-us/sql/t-sql/language-elements/set-operators-except-and-intersect-transact-sql?view=sql-server-ver15)
  - [Default](https://docs.microsoft.com/en-us/sql/relational-databases/tables/specify-default-values-for-columns?view=sql-server-ver15)
  - [Check](https://docs.microsoft.com/en-us/sql/relational-databases/tables/create-check-constraints?view=sql-server-ver15)
  - [Unique](https://docs.microsoft.com/en-us/sql/relational-databases/tables/create-unique-constraints?view=sql-server-ver15)
  - [Null/Not Null](https://docs.microsoft.com/en-us/sql/t-sql/queries/is-null-transact-sql?view=sql-server-ver15)
  - [Primary Keys](https://docs.microsoft.com/en-us/sql/relational-databases/tables/create-primary-keys?view=sql-server-ver15)
  - [Foreign Keys](https://docs.microsoft.com/en-us/sql/relational-databases/tables/create-foreign-key-relationships?view=sql-server-ver15)
