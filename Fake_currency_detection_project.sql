create database currency;
use currency;

CREATE TABLE Users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Role ENUM('Admin','Cashier','BankOfficial','System') DEFAULT 'Cashier',
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE CurrencyNotes (
    NoteID INT PRIMARY KEY AUTO_INCREMENT,
    SerialNumber VARCHAR(50) UNIQUE,
    Denomination DECIMAL(10,2) NOT NULL, -- e.g., 100, 500, 2000
    Country VARCHAR(50) DEFAULT 'India',
    IssueYear YEAR,
    UploadedBy INT,
    UploadedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UploadedBy) REFERENCES Users(UserID)
);

CREATE TABLE VerificationResults (
    ResultID INT PRIMARY KEY AUTO_INCREMENT,
    NoteID INT,
    VerifiedBy INT, -- User or ML system
    VerificationMethod ENUM('Manual','Machine','ML_Model') DEFAULT 'ML_Model',
    Result ENUM('Genuine','Fake','Suspicious') NOT NULL,
    ConfidenceScore DECIMAL(5,2), -- e.g., 92.50%
    VerifiedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (NoteID) REFERENCES CurrencyNotes(NoteID),
    FOREIGN KEY (VerifiedBy) REFERENCES Users(UserID)
);

CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY AUTO_INCREMENT,
    NoteID INT,
    UserID INT, -- cashier or bank official
    Location VARCHAR(100),
    Purpose VARCHAR(100), -- e.g., Deposit, Withdrawal, Shop Payment
    TransactionDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (NoteID) REFERENCES CurrencyNotes(NoteID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

INSERT INTO Users (Name, Email, Role) VALUES
('Amit Sharma','amit.sharma@example.com','Admin'),
('Priya Singh','priya.singh@example.com','Cashier'),
('Rohit Verma','rohit.verma@example.com','Cashier'),
('Sneha Nair','sneha.nair@example.com','BankOfficial'),
('Karan Gupta','karan.gupta@example.com','BankOfficial'),
('Meena Iyer','meena.iyer@example.com','Cashier'),
('Raj Malhotra','raj.malhotra@example.com','Cashier'),
('Pooja Desai','pooja.desai@example.com','BankOfficial'),
('Arjun Mehta','arjun.mehta@example.com','Cashier'),
('Anjali Patil','anjali.patil@example.com','Cashier'),
('Vikas Kumar','vikas.kumar@example.com','Admin'),
('Divya Reddy','divya.reddy@example.com','Cashier'),
('Saurabh Joshi','saurabh.joshi@example.com','BankOfficial'),
('Ritika Ghosh','ritika.ghosh@example.com','Cashier'),
('Nikhil Chawla','nikhil.chawla@example.com','Cashier'),
('Alok Sinha','alok.sinha@example.com','BankOfficial'),
('Monica Kapoor','monica.kapoor@example.com','Cashier'),
('Deepak Yadav','deepak.yadav@example.com','Cashier'),
('Swati Mishra','swati.mishra@example.com','BankOfficial'),
('System Bot','system.bot@ml.com','System');

INSERT INTO CurrencyNotes (SerialNumber, Denomination, Country, IssueYear, UploadedBy) VALUES
('A123456789', 500, 'India', 2018, 2),
('B987654321', 2000, 'India', 2016, 3),
('C112233445', 100, 'India', 2020, 4),
('D556677889', 500, 'India', 2019, 5),
('E998877665', 200, 'India', 2017, 6),
('F443322110', 50, 'India', 2015, 7),
('G221144335', 2000, 'India', 2018, 8),
('H665544332', 500, 'India', 2019, 9),
('I778899001', 100, 'India', 2017, 10),
('J990011223', 200, 'India', 2016, 11),
('K554433221', 500, 'India', 2020, 12),
('L667788990', 2000, 'India', 2016, 13),
('M889900112', 100, 'India', 2015, 14),
('N223344556', 200, 'India', 2018, 15),
('O334455667', 500, 'India', 2019, 16),
('P112299887', 2000, 'India', 2016, 17),
('Q445566778', 100, 'India', 2020, 18),
('R887766554', 50, 'India', 2014, 19),
('S334422110', 500, 'India', 2018, 2),
('T221199887', 2000, 'India', 2017, 3);

INSERT INTO VerificationResults (NoteID, VerifiedBy, VerificationMethod, Result, ConfidenceScore) VALUES
(1, 20, 'ML_Model', 'Genuine', 95.2),
(2, 20, 'ML_Model', 'Fake', 87.6),
(3, 4, 'Manual', 'Genuine', 99.0),
(4, 20, 'ML_Model', 'Suspicious', 70.4),
(5, 6, 'Manual', 'Genuine', 96.3),
(6, 7, 'Manual', 'Fake', 80.5),
(7, 20, 'ML_Model', 'Genuine', 92.7),
(8, 20, 'ML_Model', 'Genuine', 94.8),
(9, 20, 'ML_Model', 'Fake', 82.1),
(10, 11, 'Manual', 'Genuine', 97.2),
(11, 20, 'ML_Model', 'Suspicious', 73.5),
(12, 20, 'ML_Model', 'Genuine', 91.9),
(13, 20, 'ML_Model', 'Fake', 85.0),
(14, 20, 'ML_Model', 'Genuine', 96.4),
(15, 20, 'ML_Model', 'Genuine', 93.1),
(16, 20, 'ML_Model', 'Fake', 78.6),
(17, 20, 'ML_Model', 'Genuine', 97.8),
(18, 20, 'ML_Model', 'Suspicious', 68.9),
(19, 20, 'ML_Model', 'Genuine', 92.5),
(20, 20, 'ML_Model', 'Fake', 84.7);


INSERT INTO Transactions (NoteID, UserID, Location, Purpose) VALUES
(1, 2, 'Mumbai', 'Shop Payment'),
(2, 3, 'Delhi', 'Bank Deposit'),
(3, 4, 'Chennai', 'ATM Withdrawal'),
(4, 5, 'Pune', 'Bill Payment'),
(5, 6, 'Bangalore', 'Cash Deposit'),
(6, 7, 'Hyderabad', 'Loan Repayment'),
(7, 8, 'Kolkata', 'Shop Payment'),
(8, 9, 'Nagpur', 'Bank Deposit'),
(9, 10, 'Indore', 'ATM Withdrawal'),
(10, 11, 'Lucknow', 'Cash Deposit'),
(11, 12, 'Ahmedabad', 'Shop Payment'),
(12, 13, 'Jaipur', 'Bank Deposit'),
(13, 14, 'Surat', 'Loan Repayment'),
(14, 15, 'Patna', 'ATM Withdrawal'),
(15, 16, 'Bhopal', 'Bill Payment'),
(16, 17, 'Chandigarh', 'Shop Payment'),
(17, 18, 'Ranchi', 'Bank Deposit'),
(18, 19, 'Coimbatore', 'Cash Deposit'),
(19, 2, 'Goa', 'ATM Withdrawal'),
(20, 3, 'Mysore', 'Bill Payment');





desc users;
desc currencynotes;
desc verificationresults;
desc transactions;

select * from users;
select * from currencynotes;
select * from verificationresults;
select * from transactions;

-- Subquery
-- display users who uploaded currency of 500
select * from users where UserID in
(select uploadedby from currencynotes where denomination=500);

-- display currencynotes where result is genuine and confidencescore>80
select * from currencynotes where noteid in
(select result from verificationresults where result="Genuine" and confidenceScore>80
);

-- display currencynotes which are used to bank deposit
select * from currencynotes where noteid in
(select noteid from transactions where purpose="Bank Deposit");

-- display currency which are verified using ml_model
select * from currencynotes where noteid in
(select noteid from verificationresults where verificationMethod="ML_model");

-- JOIN
-- display username with currency details 
select u.name,u.userid,c.noteid,c.serialnumber,c.denomination,c.issueyear
from users u left join currencynotes c 
on u.userid=c.uploadedby;

-- display verification method and result with currency details where verificationMethod is ML model
select c.noteid,c.serialnumber,c.denomination,c.issueyear,v.verificationmethod,v.result
from currencynotes c right join verificationresults v  
on c.noteid=v.noteid where v.verificationmethod="ML_model";

-- display all users having userid=4 with all transaction having denomination 100
select c.noteid,c.denomination,c.issueyear,t.transactionID,t.userid
from currencynotes c left join transactions t
on c.noteid=t.noteid where denomination=100
union
select c.noteid,c.denomination,c.issueyear,t.transactionID,t.userid
from currencynotes c right join transactions t
on c.noteid=t.noteid where t.userid=4;

-- display all possible pairs of notes and user
select c.noteid,u.userid,u.name
from users u cross join currencynotes c;

-- views
-- 
create view currency as select c.NoteID,c.SerialNumber,c.denomination,v.result
from currencynotes c, verificationresults v 
where c.noteid=v.noteid;
select * from currency;

create view user1 as select u.userid,u.name,u.role,c.noteid,c.denomination
from users u,currencynotes c where u.userid=c.uploadedby;
select * from user1;

create view user2 as select u.userid,u.name,u.role,v.noteid,v.verificationmethod
from users u,verificationresults v
where u.userid=v.verifiedby;
select * from user2;

create view currency2 as select c.noteid,c.serialnumber,c.denomination,t.transactionid,t.purpose,t.location
from currencynotes c,transactions t
where c.noteid=t.noteid;
select * from currency2;
