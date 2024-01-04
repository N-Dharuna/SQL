drop database if exists clinictrial;
drop database if exists clinictrial_info;
create database clinictrial_info;
use clinictrial_info;
select * from clinictrial;



# 1. Add index name fast on Name
alter table clinictrial change column name ctr_name varchar(50);
create index fast on clinictrial(ctr_name);

# 2. Describe the schema of table
describe clinictrial;

# 3. Find average of Age
select round(avg(age)) from clinictrial;

# 4. Find minimum of Age
select min(age) from clinictrial as min_age;

# 5. Find maximum of Age
select max(age) from clinictrial as max_age;

# 6. Find average age of those were pregnant and not pregnant
select pregnant, round(avg(age)) as Avg_Age from clinictrial group by pregnant; 

# 7. Find average blood pressure of those had drug reaction and did not had drug reaction
select Drug_Reaction, round(avg(bp)) as Avg_BP from clinictrial group by drug_reaction;

# 8. Add new column name as ‘Age_group’ and those having age between 16 & 21 should be categorized as Low, more than 21 and less than 35 should be categorized as Middle and above 35 should be categorized as High.
alter table clinictrial add column age_group varchar (20) as (case when age >= 16 and age <= 21 then 'low' when age >= 21 and age <= 35 then 'middle' else 'high' end);

# 9. Change ‘Age’ of Reetika to 32
update clinictrial set age = '32' where ctr_name = 'reetika';

# 10. Change name of Reena as Shara’
update clinictrial set ctr_name = 'Shara' where ctr_name = 'reena';

# 11. Remove Chlstrl column
alter table clinictrial drop column chlstrl;

# 12. Select only Name, Age and BP
select ctr_name,Age,BP from clinictrial;

# 13. Select ladies whose first name starts with ‘E’
select * from clinictrial where ctr_name like 'E%';

# 14. Select ladies whose Age_group were Low
select ctr_name,age,age_group from clinictrial where age_group = 'low';
select * from clinictrial where Age_group = 'low';

# 15. Select ladies whose Age_group were High
select ctr_name,age,age_group from clinictrial where age_group = 'high';

# 16. Select ladies whose name starts with ‘A’ and those were pregnant
select ctr_name, pregnant from clinictrial where ctr_name like 'a%' and pregnant = 'yes';

# 17. Identify ladies whose BP was more than 120
select ctr_name,bp from clinictrial where bp > 120;

# 18. Identify ladies whose BP was between 100 and 120
select ctr_name,bp from clinictrial where bp between 100 and 120;

# 19. Identify ladies who had low anxiety aged less than 30
select ctr_name,age,anxty_lh from clinictrial where age < 30;

# 20. Select ladies whose name ends with ‘i’
select * from clinictrial where ctr_name like '%I';

# 21. Select ladies whose name ends with ‘a’
select * from clinictrial where ctr_name like '%a';

# 22. Select ladies whose name starts with ‘K’
select * from clinictrial where ctr_name like 'k%';

# 23. Select ladies whose name have ‘a’ anywhere
select * from clinictrial where ctr_name like '%a%';

# 24. Order ladies in ascending way based on ‘BP’
select * from clinictrial order by BP asc ;

# 25. Order ladies in descending way based on ‘Age’
select * from clinictrial order by age desc;
