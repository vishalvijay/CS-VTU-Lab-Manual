CREATE DATABASE BANK;
USE BANK;
CREATE TABLE IF NOT EXISTS BRANCH
( branchname VARCHAR(15) PRIMARY KEY,
  branchcity VARCHAR(15),
  assets DECIMAL(10,2)
);

CREATE TABLE IF NOT EXISTS ACCOUNT
( accno  INTEGER(8) PRIMARY KEY,
  branchname VARCHAR(15) REFERENCES BRANCH(branchname) ON DELETE CASCADE,
  balance DECIMAL(10,2)
);

CREATE TABLE IF NOT EXISTS CUSTOMER
( customername  VARCHAR(15) PRIMARY KEY, 
  customerstreet VARCHAR(15), 
  customercity  VARCHAR(15)
);

CREATE TABLE IF NOT EXISTS LOAN
( loan_number INTEGER(8) PRIMARY KEY,
  branchname VARCHAR(15) REFERENCES BRANCH(branchname),
  amount DECIMAL(10,2)
);

CREATE TABLE IF NOT EXISTS DEPOSITOR
( customername VARCHAR(15) REFERENCES CUSTOMER(customername),
  accno  INTEGER  REFERENCES ACCOUNT(accno) 
);

CREATE TABLE IF NOT EXISTS BORROWER
( customername	VARCHAR(15) REFERENCES CUSTOMER(customername),
loan_number	INTEGER(8) REFERENCES LOAN(loan_number)
);


