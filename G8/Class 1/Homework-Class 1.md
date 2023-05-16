Task: Train Station Database Management

You are tasked with creating a database to manage information related to a Train Station. Follow the steps below:

Create Database: Create a new database called "TrainStationDB" to store the train station information.

Create Tables: Design and create the following tables in the "TrainStationDB" database:

a. Table: Stations

Columns: StationID (int), StationName (nvarchar), City (nvarchar)
b. Table: Trains

Columns: TrainID (int), TrainName (nvarchar), TrainType (nvarchar), DepartureTime (time), ArrivalTime (time), StationID (int, foreign key references Stations(StationID))
Insert Data: Insert sample data into the created tables.

a. Insert at least 3 records into the "Stations" table, including StationID, StationName, and City.

b. Insert at least 5 records into the "Trains" table, including TrainID, TrainName, TrainType, DepartureTime, ArrivalTime, and corresponding StationID.

Remove Data: Remove specific data from the tables.

a. Remove a train record from the "Trains" table based on the TrainID.

b. Remove a station record from the "Stations" table based on the StationID.

Drop Tables: Drop unnecessary tables.

a. Drop the "Trains" table.

Document and Submit: Prepare a document summarizing your implementation, including the SQL scripts or commands used for each step. Also, include the resulting tables' structure and data after the insertions and deletions.

Instructions:

Create a new database named "TrainStationDB" using your preferred SQL tool (e.g., SQL Server Management Studio, MySQL Workbench, etc.).

Design and create the required tables according to the given specifications.

Write SQL scripts or commands to insert sample data into the tables.

Write SQL scripts or commands to remove specific records from the tables.

Write SQL scripts or commands to drop unnecessary tables.

Test your implementation by executing the SQL scripts or commands in your chosen SQL tool.

Prepare a document summarizing your implementation, including the SQL scripts or commands used for each step, and the resulting table structure and data after each operation.

Submission:
Submit the following for evaluation:

SQL script file or code snippets.
Document summarizing your implementation.
Note: Make sure to provide clear instructions on how to execute your code and include any necessary SQL setup or sample data for testing.