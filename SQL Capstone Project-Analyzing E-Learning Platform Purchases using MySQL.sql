-- TO CREATE DATABASE 
CREATE DATABASE CAPSTONE;
USE CAPSTONE;

-- TO CREATE TABLE LEARNERS
CREATE TABLE LEARNERS (
LEARNER_ID     INT               PRIMARY KEY,
FULL_NAME      VARCHAR(50)       NOT NULL,
COUNTRY        VARCHAR(50)       NULL);

INSERT INTO LEARNERS(LEARNER_ID, FULL_NAME, COUNTRY)
VALUES              (202601, 'ALEX',   'INDIA'),
                    (202602, 'ALIS',   'CHINA'),
                    (202603, 'JUNA',   'INDIA'),
                    (202604, 'LARA',   'SINGAPPUR'),
                    (202605, 'JAMES',  'MALAYSIA'),
                    (202606, 'ZYAN',   'SINGAPPUR'),
                    (202607, 'TARA',   'SINGAPPUR'),
                    (202608, 'JULIANA', 'INDIA'),
                    (202609, 'CATHIE',  'CHINA'),
                    (202610, 'DARVIN',  'MALAYSIA'),
                    (202611, 'STEVAN',  'LONDON'),
                    (202612, 'MAGIC',   'LONDON'); 
  SELECT * FROM LEARNERS;                  
		

-- TO CREATE TABLE COURSES
CREATE TABLE COURSES (
COURSE_ID      INT             PRIMARY KEY,
COURSE_NAME    VARCHAR(50)     NOT NULL,
CATEGORY       VARCHAR(50)     NULL,
UNIT_PRICE     DECIMAL(10,2)   DEFAULT 0);

INSERT INTO COURSES (COURSE_ID,COURSE_NAME, CATEGORY, UNIT_PRICE)
VALUES              (101, 'SQL',     'DATABASE',               20000),
                    (102, 'PYTHON',  'PROGRAMMING',            40000),
                    (103, 'DA',      'DATA SCIENCE',           30000),
                    (104, 'JAVA',    'PROGRAMMING',            15000),
                    (105, 'POWER BI','BUSINESS INTELLIGENCE',  15000);
SELECT * FROM COURSES;
-- TO CREATE TABLE PURCHASE
CREATE TABLE PURCHASE(
PURCHASE_ID     INT           PRIMARY KEY,
LEARNER_ID      INT           NOT NULL,
COURSE_ID       INT           NOT NULL,
QUANTITY        INT           DEFAULT 0,
PURCHASE_DATE   DATE          NOT NULL,
FOREIGN KEY (LEARNER_ID) REFERENCES LEARNERS(LEARNER_ID),
FOREIGN KEY (COURSE_ID)  REFERENCES COURSES(COURSE_ID)
);
    
INSERT INTO PURCHASE(PURCHASE_ID,LEARNER_ID,COURSE_ID,QUANTITY,PURCHASE_DATE)
VALUES              ( 1,202603,102,2,'2025-01-10'),
					( 2,202602,101,3,'2025-01-21'),
                    ( 3,202601,105,1,'2025-01-11'),
                    ( 4,202605,101,1,'2025-01-08'),
                    ( 5,202606,103,2,'2025-01-04'),
                    ( 6,202604,102,1,'2025-01-17'),
                    ( 7,202612,104,3,'2025-01-05'),
                    ( 8,202608,102,1,'2025-01-25'),
                    ( 9,202607,105,1,'2025-01-03'),
                    (10,202609,103,2,'2025-01-13'),
                    (11,202611,104,2,'2025-01-01'),
                    (12,202610,105,1,'2025-01-28');

CREATE TABLE LEARNERS (
LEARNER_ID     INT               PRIMARY KEY,
FULL_NAME      VARCHAR(50)       NOT NULL,
COUNTRY        VARCHAR(50)       NULL);

INSERT INTO LEARNERS(LEARNER_ID, FULL_NAME, COUNTRY)
VALUES              (202601, 'ALEX',   'INDIA'),
                    (202602, 'ALIS',   'CHINA'),
                    (202603, 'JUNA',   'INDIA'),
                    (202604, 'LARA',   'SINGAPPUR'),
                    (202605, 'JAMES',  'MALAYSIA'),
                    (202606, 'ZYAN',   'SINGAPPUR'),
                    (202607, 'TARA',   'SINGAPPUR'),
                    (202608, 'JULIANA', 'INDIA'),
                    (202609, 'CATHIE',  'CHINA'),
                    (202610, 'DARVIN',  'MALAYSIA'),
                    (202611, 'STEVAN',  'LONDON'),
                    (202612, 'MAGIC',   'LONDON'); 
  SELECT * FROM LEARNERS;                  
		

-- TO CREATE TABLE COURSES
CREATE TABLE COURSES (
COURSE_ID      INT             PRIMARY KEY,
COURSE_NAME    VARCHAR(50)     NOT NULL,
CATEGORY       VARCHAR(50)     NULL,
UNIT_PRICE     DECIMAL(10,2)   DEFAULT 0);

INSERT INTO COURSES (COURSE_ID,COURSE_NAME, CATEGORY, UNIT_PRICE)
VALUES              (101, 'SQL',     'DATABASE',               20000),
                    (102, 'PYTHON',  'PROGRAMMING',            40000),
                    (103, 'DA',      'DATA SCIENCE',           30000),
                    (104, 'JAVA',    'PROGRAMMING',            15000),
                    (105, 'POWER BI','BUSINESS INTELLIGENCE',  15000);
SELECT * FROM COURSES;
-- TO CREATE TABLE PURCHASE
CREATE TABLE PURCHASE(
PURCHASE_ID     INT           PRIMARY KEY,
LEARNER_ID      INT           NOT NULL,
COURSE_ID       INT           NOT NULL,
QUANTITY        INT           DEFAULT 0,
PURCHASE_DATE   DATE          NOT NULL,
FOREIGN KEY (LEARNER_ID) REFERENCES LEARNERS(LEARNER_ID),
FOREIGN KEY (COURSE_ID)  REFERENCES COURSES(COURSE_ID)
);
    
INSERT INTO PURCHASE(PURCHASE_ID,LEARNER_ID,COURSE_ID,QUANTITY,PURCHASE_DATE)
VALUES              ( 1,202603,102,2,'2025-01-10'),
					( 2,202602,101,3,'2025-01-21'),
                    ( 3,202601,105,1,'2025-01-11'),
                    ( 4,202605,101,1,'2025-01-08'),
                    ( 5,202606,103,2,'2025-01-04'),
                    ( 6,202604,102,1,'2025-01-17'),
                    ( 7,202612,104,3,'2025-01-05'),
                    ( 8,202608,102,1,'2025-01-25'),
                    ( 9,202607,105,1,'2025-01-03'),
                    (10,202609,103,2,'2025-01-13'),
                    (11,202611,104,2,'2025-01-01'),
                    (12,202610,105,1,'2025-01-28');
 SELECT *FROM PURCHASE;
 
 -- TO Use aliases for column names (e.g., AS total_revenue).                   
SELECT PUR.QUANTITY,COUR.UNIT_PRICE, PUR.QUANTITY * COUR.UNIT_PRICE AS TOTAL_REVENUE
FROM PURCHASE AS PUR
JOIN COURSES AS COUR
ON PUR.COURSE_ID = COUR.COURSE_ID;


-- To Sort results appropriately (e.g., highest total_spent first)
SELECT LE.LEARNER_ID,LE.FULL_NAME,
       SUM(PU.QUANTITY*CO.UNIT_PRICE) AS HIGHER_SPENT
FROM   LEARNERS AS LE
       JOIN PURCHASE AS PU
       ON LE.LEARNER_ID = PU.LEARNER_ID
       JOIN COURSES AS CO
       ON CO.COURSE_ID = PU.COURSE_ID
       GROUP BY LE.LEARNER_ID,LE.FULL_NAME
       ORDER BY HIGHER_SPENT DESC;

-- TO Combine learner, course, and purchase data.
SELECT L.LEARNER_ID,L.FULL_NAME,L.COUNTRY,
       P.PURCHASE_ID,P.QUANTITY,P.PURCHASE_DATE,
       C.COURSE_ID,C.COURSE_NAME,C.CATEGORY,C.UNIT_PRICE
FROM   LEARNERS AS L       
       JOIN PURCHASE AS P
       ON L.LEARNER_ID =P.LEARNER_ID
       JOIN COURSES AS C
       ON P.COURSE_ID = C.COURSE_ID;
	
-- TO Display each learner’s purchase details (course name, category, quantity, total amount, and purchase date).   
SELECT L.FULL_NAME,
       C.COURSE_NAME,C.CATEGORY,
       P.QUANTITY,
       P.QUANTITY * C.UNIT_PRICE AS TOTAL_AMOUNT,
       P.PURCHASE_DATE
FROM   LEARNERS AS L       
       JOIN PURCHASE AS P
       ON L.LEARNER_ID =P.LEARNER_ID
       JOIN COURSES AS C
       ON P.COURSE_ID = C.COURSE_ID;       
       
-- To Display each learner’s total spending (quantity × unit_price) along with their country.
SELECT LE.LEARNER_ID,LE.FULL_NAME,LE.COUNTRY,
       SUM(PU.QUANTITY*CO.UNIT_PRICE) AS TOTAL_SPENDING
FROM   LEARNERS AS LE
       JOIN PURCHASE AS PU
       ON LE.LEARNER_ID = PU.LEARNER_ID
       JOIN COURSES AS CO
       ON CO.COURSE_ID = PU.COURSE_ID
       GROUP BY LE.LEARNER_ID,LE.FULL_NAME,LE.COUNTRY;       
       
  -- TO Find the top 3 most purchased courses based on total quantity sold.
SELECT      
       (SELECT COURSE_NAME
FROM   COURSES
       WHERE COURSES.COURSE_ID = PURCHASE.COURSE_ID) AS COURSE,
       SUM(QUANTITY) AS SOLD_TOTAL_QUANTITY
       FROM PURCHASE
       GROUP BY COURSE_ID
       ORDER BY SOLD_TOTAL_QUANTITY DESC
       LIMIT 3;
       
-- TO Show each course category’s total revenue and the number of unique learners who purchased from that category.
SELECT COURSES.CATEGORY,
       SUM(PURCHASE.QUANTITY * COURSES.UNIT_PRICE) AS TOTAL_REVENUE,
       COUNT(DISTINCT PURCHASE.LEARNER_ID) AS UNIQUE_LEARNERS
FROM   COURSES,PURCHASE,LEARNERS	
       WHERE COURSES.COURSE_ID = PURCHASE.COURSE_ID
	   AND   LEARNERS.LEARNER_ID = PURCHASE.LEARNER_ID
       GROUP BY COURSES.CATEGORY;      
       
       
-- TO  List all learners who have purchased courses from ONE OR more than one category.
SELECT LEARNERS.LEARNER_ID,LEARNERS.FULL_NAME
FROM LEARNERS,PURCHASE,COURSES
WHERE LEARNERS.LEARNER_ID = PURCHASE.LEARNER_ID
AND   COURSES.COURSE_ID  =  PURCHASE.COURSE_ID    
GROUP BY LEARNERS.LEARNER_ID, LEARNERS.FULL_NAME
HAVING COUNT(DISTINCT COURSES.CATEGORY) >= 1;      

-- TO Identify courses that have not been purchased at all.
SELECT COURSES.COURSE_ID,COURSES.COURSE_NAME
FROM COURSES
WHERE COURSE_ID NOT IN(SELECT COURSE_ID FROM PURCHASE);
