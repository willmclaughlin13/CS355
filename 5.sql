USE wmclaughlin;

DROP TABLE IF EXISTS account;  
DROP TABLE IF EXISTS address;  
DROP TABLE IF EXISTS skill;  
DROP TABLE IF EXISTS school;  
DROP TABLE IF EXISTS account_school;  
DROP TABLE IF EXISTS account_company;
DROP TABLE IF EXISTS account_skill;
DROP TABLE IF EXISTS company;
DROP TABLE IF EXISTS resume_school;        
DROP TABLE IF EXISTS resume_company;
DROP TABLE IF EXISTS resume_skill;
DROP TABLE IF EXISTS resume;                        

CREATE TABLE account (account_id INT AUTO_INCREMENT PRIMARY KEY, email VARCHAR(256) UNIQUE, first_name VARCHAR(50), last_name VARCHAR(50));

CREATE TABLE address (address_id INT AUTO_INCREMENT PRIMARY KEY, street VARCHAR(50), zip_code INT);

CREATE TABLE skill (skill_id INT AUTO_INCREMENT PRIMARY KEY, skill_name VARCHAR(50) UNIQUE, description VARCHAR(256));

CREATE TABLE company (company_id INT AUTO_INCREMENT PRIMARY KEY, company_name VARCHAR(256) UNIQUE);

CREATE TABLE school (school_id INT AUTO_INCREMENT PRIMARY KEY, school_name VARCHAR(256) UNIQUE, address_id INT,
FOREIGN KEY (address_id) REFERENCES address (address_id) ON DELETE CASCADE);

CREATE TABLE account_school (account_id INT, school_id INT, PRIMARY KEY (account_id, school_id), start_date timestamp, end_date timestamp, gpa FLOAT, 
FOREIGN KEY (account_id) REFERENCES account (account_id) ON DELETE CASCADE,
FOREIGN KEY (school_id) REFERENCES school (school_id) ON DELETE CASCADE);

CREATE TABLE account_company (account_id INT, company_id INT, PRIMARY KEY (account_id, company_id),
FOREIGN KEY (account_id) REFERENCES account (account_id) ON DELETE CASCADE,
FOREIGN KEY (company_id) REFERENCES company (company_id) ON DELETE CASCADE);

CREATE TABLE company_address (company_id INT, address_id INT, PRIMARY KEY (company_id, address_id),
FOREIGN KEY (company_id) REFERENCES company (company_id) ON DELETE CASCADE,
FOREIGN KEY (address_id) REFERENCES address (address_id) ON DELETE CASCADE);

CREATE TABLE account_skill (account_id INT, skill_id INT, PRIMARY KEY (account_id, skill_id),
FOREIGN KEY (account_id) REFERENCES account (account_id) ON DELETE CASCADE,
FOREIGN KEY (skill_id) REFERENCES skill (skill_id) ON DELETE CASCADE);

CREATE TABLE resume_school (resume_id INT, school_id INT, PRIMARY KEY (resume_id, school_id),
FOREIGN KEY (resume_id) REFERENCES resume (resume_id) ON DELETE CASCADE,
FOREIGN KEY (school_id) REFERENCES school (school_id) ON DELETE CASCADE);

CREATE TABLE resume_company (resume_id INT, company_id INT, PRIMARY KEY (resume_id, company_id), date_shared timestamp, was_hired bool,
FOREIGN KEY (resume_id) REFERENCES resume (resume_id) ON DELETE CASCADE,
FOREIGN KEY (company_id) REFERENCES company (company_id) ON DELETE CASCADE);

CREATE TABLE resume_skill (skill_id INT, resume_id INT, PRIMARY KEY (skill_id, resume_id),
FOREIGN KEY (skill_id) REFERENCES skill (skill_id) ON DELETE CASCADE,
FOREIGN KEY (resume_id) REFERENCES resume (resume_id) ON DELETE CASCADE);

CREATE TABLE resume (resume_id INT AUTO_INCREMENT PRIMARY KEY, account_id INT, resume_name varchar(256), 
FOREIGN KEY (account_id) REFERENCES account (account_id) ON DELETE CASCADE);


INSERT INTO account (account_id, email, first_name, last_name) VALUES
	(1,'mikehawk@ssu.edu', 'Michael', 'Hawk'),
    (2,'dbrian@ssu.edu', 'David', 'Brian'),
    (3,'kshmoo@ssu.edu', 'Kyle', 'Shmoo'),
    (4,'funit@ssu.edu', 'Frank', 'Unit'),
    (5,'hmess@ssu.edu', 'Hot', 'Mess');
    
INSERT INTO address (address_id, street, zip_code) VALUES
	(1, 'Vine', 94931),
    (2, 'Pine', 94123),
    (3, 'Birch', 94904),
    (4, 'Stone', 94927),
    (5, 'Port', 94939);
    
INSERT INTO account_company (account_id, company_id) VALUES
	(1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (4, 1);
    
INSERT INTO company (company_id, company_name) VALUES
	(1, 'Whomst'),
    (2, 'Dyre'),
    (3, 'Wholm'),
    (4, 'Yonder'),
    (5, 'Shant');

INSERT INTO skill (skill_id, skill_name, description) VALUES
	(1, 'Flying', 'Moving quickly in any direction, seemingly defying gravity.'),
    (2, 'Falling', 'Like flying, but obeying gravity.'),
    (3, 'Shooting the breeze', 'A familiar banter.'),
    (4, 'Scatting', 'A form of singing where you may not use words that exist, but you must use words.'),
    (5, 'Bouyance', 'Not sinking.');

INSERT INTO school (school_id, school_name, address_id) VALUES
	(1, 'Vinyard', 1),
    (2, 'Fine Pine', 2),
    (3, 'Birchwood', 3),
    (4, 'Hard Stone', 4),
    (5, 'Davenport', 5);
    
INSERT INTO resume (resume_id, account_id, resume_name) VALUES
	(1, 1, 'Mike_1'),
    (2, 1, 'Mike_2'),
    (3, 1, 'Mike_3'),
    (4, 1, 'Mike_4'),
    (5, 1, 'Mike_5'),
    (6, 2, 'Dave_1'),
    (7, 2, 'Dave_2'),
    (8, 3, 'Kyle_1'),
    (9, 3, 'Kyle_2'),
    (10, 3, 'Kyle_3'),
    (11, 4, 'Frank_1'),
    (12, 4, 'Frank_2'),
    (13, 4, 'Frank_3'),
    (14, 5, 'Mess_1'),
    (15, 5, 'Mess_2');
    
INSERT INTO account_skill (account_id, skill_id) VALUES
	(1, 1),
    (1, 2),
    (1, 4),
    (2, 2),
    (3, 2),
    (5, 2),
    (2, 1),
    (3, 1),
    (1, 3);
    
INSERT INTO account_school (account_id, school_id, start_date, end_date, gpa) VALUES
	(1, 5, '2012-08-22 12:00', '2017-05-16 12:00', 3.50),
    (2, 4, '2010-08-22 12:00', '2015-05-16 12:00', 2.70),
    (3, 3, '2013-08-22 12:00', '2017-05-16 12:00', 1.90),
    (4, 2, '2008-08-22 12:00', '2012-05-16 12:00', 3.90),
    (5, 1, '2010-08-22 12:00', '2010-05-16 12:00', 2.40);
    
INSERT INTO company_address (company_id, address_id) VALUES
	(1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);
    
INSERT INTO resume_school (resume_id, school_id) VALUES
	(1, 1),
    (1, 2),
    (1, 3),
    (1, 4),
    (1, 5),
    (2, 1),
    (2, 2),
    (2, 4),
    (3, 1),
    (3, 5),
    (4, 4),
    (4, 5),
    (5, 1),
    (5, 3),
    (5, 4);
    
INSERT INTO resume_company (resume_id, company_id, date_shared, was_hired) VALUES
	(1, 1, '2017-08-22 12:00', 0),
    (1, 1, '2017-08-22 12:00', 0),
    (1, 1, '2017-08-22 12:00', 0),
    (1, 1, '2017-08-22 12:00', 0),
    (1, 1, '2017-08-22 12:00', 0),
    (1, 1, '2017-08-22 12:00', 0),
    (1, 1, '2017-08-22 12:00', 0),
    (1, 1, '2017-08-22 12:00', 0),
    (1, 1, '2017-08-22 12:00', 0),
    (1, 1, '2017-08-22 12:00', 0),
    (1, 1, '2017-08-22 12:00', 0),
    (1, 1, '2017-08-22 12:00', 0),
    (1, 1, '2017-08-22 12:00', 0),
    (1, 1, '2017-08-22 12:00', 0),
    (1, 1, '2017-08-22 12:00', 0); 