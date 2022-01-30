CREATE TABLE companies (
    company_id VARCHAR(255),
    company_name VARCHAR(255) DEFAULT 'X',
    headquarters_phone_number VARCHAR(255),
    PRIMARY KEY (company_id),
    UNIQUE KEY (headquarters_phone_number)
);

DROP TABLE companies;

CREATE TABLE companies (
    company_id INT AUTO_INCREMENT,
    company_name VARCHAR(255) NOT NULL,
    headquarters_phone_number VARCHAR(255),
    PRIMARY KEY (company_id)
);

ALTER TABLE companies
MODIFY company_name varchar(255) NULL;

ALTER TABLE companies
CHANGE COLUMN company_name  company_name varchar(255) NOT NULL;

INSERT INTO companies (headquarters_phone_number,company_name)
VALUES ('+1 (202)-555-0196', 'Company A');

SELECT *FROM companies;

ALTER TABLE companies
MODIFY COLUMN headquarters_phone_number varchar(255) NULL;

ALTER TABLE companies
CHANGE COLUMN headquarters_phone_number headquarters_phone_number varchar(255) NOT NULL;

CREATE TABLE IF NOT EXISTS test (
    numbers INT(10),
    words VARCHAR(10)
);

SELECT 
    *
FROM
    test;

DROP table test;
/*
Comment 1
comment 2
*/

#Comment 
-- comment