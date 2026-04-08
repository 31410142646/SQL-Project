Project Overview:
This project focuses on designing a Fake Currency Detection System using MySQL to manage, track, and analyze currency verification data.
It simulates a real-world banking system where currency notes are verified using manual methods, machine checks, and ML-based systems.

Objectives:
1.Detect fake and suspicious currency notes.
2.Maintain records of currency verification.
3.Track transactions involving currency notes.
4.Analyze verification results using SQL queries.

Database: MySQL
Concepts Applied:
1.Joins (INNER, LEFT, RIGHT, CROSS)
2.Subqueries
3.Views
4.Foreign Keys
5.Constraints
6.Aggregations

Database Design:
The system consists of the following tables:
1.Users-
Stores user details (Admin, Cashier, Bank Officials)
2.CurrencyNotes-
Stores currency note information.Includes denomination, serial number, issue year
3.VerificationResults-
Stores verification outcomes:
Genuine,
Fake,
Suspicious.
Includes confidence score and verification method.
4.Transactions-
Tracks how and where currency notes are used

Relationships:
One user can upload multiple currency notes.
Each note can have a verification result.
Transactions are linked to both users and currency notes.

Sample Insights:
1.Detection of fake and suspicious notes
2.Tracking of high-risk transactions
3.Identification of verification methods (Manual vs ML)
3.Analysis of currency usage across locations
