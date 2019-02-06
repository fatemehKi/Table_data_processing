/*HOME WORK EXERCISE*/
USE day3
drop table emploexe
create table emploexe
(
NAME varchar(50),
TEAM varchar(50),
SALARY DECIMAL(8,2),
SICKLEAVE INT,
ANNUALLEAVE INT,
);

INSERT INTO emploexe
VALUES
('ADAMS', 'RESEARCH', 34000.00, 34, 12),
('WILKES', 'MARKETING', 31000.00, 40, 9),
('STOKES', 'MARKETING', 36000.00, 20, 19),
('MEZA', 'COLLECTIONS', 40000.00, 30, 27),
('MERRICK', 'RESEARCH', 45000.00, 20, 17),
('RICHARDSON', 'MARKETING', 42000.00, 25, 18),
('FURY', 'COLLECTIONS', 35000.00, 22, 14),
('PRECOURT', 'PR', 37500.00, 24, 24);

/*PROBLEM 1*/
SELECT NAME, SALARY
FROM emploexe 
WHERE SICKLEAVE<25
ORDER BY NAME

/*PROBLEM 2*/
SELECT TEAM, AVG(SALARY) AS AVE_SALARY, AVG(SICKLEAVE) AS AVE_SICK, AVG(ANNUALLEAVE) AS AVE_ANN_LEA from emploexe
GROUP BY TEAM;

/*PROBLEM 3*/
drop table Prob3
create table Prob3
(Cheque int primary key identity (1,1),
payee varchar(50),
amount decimal(6,2),
remark varchar(100)
);
INSERT INTO Prob3
values
('Ma Bell', 150.00, 'Have sons next time'),
('Reading R.R.', 245.34, 'train to chicago'),
('Ma Bell', 200.32, 'Cellular Phone'),
('Local Utilities', 98.00, 'Gas'),
('Joes Stele and dent', 150.00, 'Groceries'),
('Cash', 25.00, 'Wild night cut'),
('Joans Gas', 25.10, 'Gas');

select * from Prob3

select payee, sum(amount) as sum_am
from Prob3
where amount < 100
group by payee 


/*Class Excercise*/
/*Excercise 1*/
SELECT Cheque, remark from Prob3 where payee like '%Gas%' OR payee like '%Cash' OR remark like '%Gas%' OR remark like '%Cash'
order by remark

/*Excercise 2*/
SELECT cheque, payee, remark from Prob3 where payee like '%Gas%' OR payee like '%Cash' OR remark like '%Gas%' OR remark like '%Cash'
group by cheque, payee, remark
order by remark

