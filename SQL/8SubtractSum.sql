/*
Subtract the sum
NOTE! This kata can be more difficult than regular 8-kyu katas (lets say 7 or 6 kyu)
Complete the function which get an input number n such that n >= 10 and n < 10000, then:
  Sum all the digits of n.
  Subtract the sum from n, and it is your new n.
  If the new n is in the list below return the associated fruit, otherwise return back to task 1.
Example
n = 325
sum = 3+2+5 = 10
n = 325-10 = 315 (not in the list)
sum = 3+1+5 = 9
n = 315-9 = 306 (not in the list)
sum = 3+0+6 = 9
n =306-9 = 297 (not in the list)
*/

/* CREATE TABLE FRUITS */
create table fruits (id int, name varchar);

Insert Into fruits (id, name) values (1,'kiwi');
Insert Into fruits (id, name) values (2,'pear');
Insert Into fruits (id, name) values (3,'kiwi');
Insert Into fruits (id, name) values (4,'banana');
Insert Into fruits (id, name) values (5,'melon');
Insert Into fruits (id, name) values (6,'banana');
Insert Into fruits (id, name) values (7,'melon');
Insert Into fruits (id, name) values (8,'pineapple');
Insert Into fruits (id, name) values (9,'apple');
Insert Into fruits (id, name) values (10,'pineapple');
Insert Into fruits (id, name) values (11,'cucumber');
Insert Into fruits (id, name) values (12,'pineapple');
Insert Into fruits (id, name) values (13,'cucumber');
Insert Into fruits (id, name) values (14,'orange');
Insert Into fruits (id, name) values (15,'grape');
Insert Into fruits (id, name) values (16,'orange');
Insert Into fruits (id, name) values (17,'grape');
Insert Into fruits (id, name) values (18,'apple');
Insert Into fruits (id, name) values (19,'grape');
Insert Into fruits (id, name) values (20,'cherry');
Insert Into fruits (id, name) values (21,'pear');
Insert Into fruits (id, name) values (22,'cherry');
Insert Into fruits (id, name) values (23,'pear');
Insert Into fruits (id, name) values (24,'kiwi');
Insert Into fruits (id, name) values (25,'banana');
Insert Into fruits (id, name) values (26,'kiwi');
Insert Into fruits (id, name) values (27,'apple');
Insert Into fruits (id, name) values (28,'melon');
Insert Into fruits (id, name) values (29,'banana');
Insert Into fruits (id, name) values (30,'melon');
Insert Into fruits (id, name) values (31,'pineapple');
Insert Into fruits (id, name) values (32,'melon');
Insert Into fruits (id, name) values (33,'pineapple');
Insert Into fruits (id, name) values (34,'cucumber');
Insert Into fruits (id, name) values (35,'orange');
Insert Into fruits (id, name) values (36,'apple');
Insert Into fruits (id, name) values (37,'orange');
Insert Into fruits (id, name) values (38,'grape');
Insert Into fruits (id, name) values (39,'orange');
Insert Into fruits (id, name) values (40,'grape');
Insert Into fruits (id, name) values (41,'cherry');
Insert Into fruits (id, name) values (42,'pear');
Insert Into fruits (id, name) values (43,'cherry');
Insert Into fruits (id, name) values (44,'pear');
Insert Into fruits (id, name) values (45,'apple');
Insert Into fruits (id, name) values (46,'pear');
Insert Into fruits (id, name) values (47,'kiwi');
Insert Into fruits (id, name) values (48,'banana');
Insert Into fruits (id, name) values (49,'kiwi');
Insert Into fruits (id, name) values (50,'banana');
Insert Into fruits (id, name) values (51,'melon');
Insert Into fruits (id, name) values (52,'pineapple');
Insert Into fruits (id, name) values (53,'melon');
Insert Into fruits (id, name) values (54,'apple');
Insert Into fruits (id, name) values (55,'cucumber');
Insert Into fruits (id, name) values (56,'pineapple');
Insert Into fruits (id, name) values (57,'cucumber');
Insert Into fruits (id, name) values (58,'orange');
Insert Into fruits (id, name) values (59,'cucumber');
Insert Into fruits (id, name) values (60,'orange');
Insert Into fruits (id, name) values (61,'grape');
Insert Into fruits (id, name) values (62,'cherry');
Insert Into fruits (id, name) values (63,'apple');
Insert Into fruits (id, name) values (64,'cherry');
Insert Into fruits (id, name) values (65,'pear');
Insert Into fruits (id, name) values (66,'cherry');
Insert Into fruits (id, name) values (67,'pear');
Insert Into fruits (id, name) values (68,'kiwi');
Insert Into fruits (id, name) values (69,'pear');
Insert Into fruits (id, name) values (70,'kiwi');
Insert Into fruits (id, name) values (71,'banana');
Insert Into fruits (id, name) values (72,'apple');
Insert Into fruits (id, name) values (73,'banana');
Insert Into fruits (id, name) values (74,'melon');
Insert Into fruits (id, name) values (75,'pineapple');
Insert Into fruits (id, name) values (76,'melon');
Insert Into fruits (id, name) values (77,'pineapple');
Insert Into fruits (id, name) values (78,'cucumber');
Insert Into fruits (id, name) values (79,'pineapple');
Insert Into fruits (id, name) values (80,'cucumber');
Insert Into fruits (id, name) values (81,'apple');
Insert Into fruits (id, name) values (82,'grape');
Insert Into fruits (id, name) values (83,'orange');
Insert Into fruits (id, name) values (84,'grape');
Insert Into fruits (id, name) values (85,'cherry');
Insert Into fruits (id, name) values (86,'grape');
Insert Into fruits (id, name) values (87,'cherry');
Insert Into fruits (id, name) values (88,'pear');
Insert Into fruits (id, name) values (89,'cherry');
Insert Into fruits (id, name) values (90,'apple');
Insert Into fruits (id, name) values (91,'kiwi');
Insert Into fruits (id, name) values (92,'banana');
Insert Into fruits (id, name) values (93,'kiwi');
Insert Into fruits (id, name) values (94,'banana');
Insert Into fruits (id, name) values (95,'melon');
Insert Into fruits (id, name) values (96,'banana');
Insert Into fruits (id, name) values (97,'melon');
Insert Into fruits (id, name) values (98,'pineapple');
Insert Into fruits (id, name) values (99,'apple');
Insert Into fruits (id, name) values (100,'pineapple');


/* CREATE FUNCTION SUBSTRACTTHESUM */
CREATE FUNCTION SubstractTheSum(n int)  RETURNS text  
AS $$   
DECLARE 
  currentn int := n;
BEGIN
  
    WHILE currentn = n OR currentn > 100 
        LOOP
            currentn := currentn - (currentn            % 10
                                      + currentn / 10       % 10
                                      + currentn / 100      % 10
                                      + currentn / 1000     % 10
                                      + currentn / 10000    % 10
                                      + currentn / 100000   % 10
                                      + currentn / 1000000  % 10
                                      + currentn / 10000000 % 10);
            
        END LOOP;
    return (SELECT f.name FROM fruits f WHERE f.id = currentn);
END;
$$
LANGUAGE plpgsql;

/* CALL SUBSTRACTTHESUM FOR EACH N*/
select SubstractTheSum(ss.n)  as res from sub_sum ss;
