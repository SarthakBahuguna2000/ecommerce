
  create database fashionbrands
  use fashionbrands
create table celebrities(celebid int primary key , firstname nvarchar(20), lastname nvarchar(20), cphone numeric(10,0), address varchar(20))

create table brands(brandid int primary key  ,celebid int  foreign key(celebid) references celebrities(celebid), bname varchar(20))
create table bendorse(brandid int  , celebid int ,foreign key(celebid) references celebrities(celebid) ,foreign key(brandid) references brands(brandid))
insert into celebrities values(101,'sharukh','khan',123456789,'mumbai')
insert into celebrities values(102,'aamir','khan',993456789,'delhi')
insert into celebrities values(103,'priyanka','chopra',8876556789,'dehradun')
insert into celebrities values(104,'amitabh','bachchan',123996789,'mumbai')
insert into celebrities values(105,'sunil','chettri',783456789,'mumbai')
insert into celebrities values(106,'akshay','kumar',433456789,'pune')
insert into celebrities values(107,'aliya','bhatt',913456789,'delhi')
insert into celebrities values(108,'ranbir','kapoor',888856789,'noida')
insert into celebrities values(109,'katrina','kaif',765456789,'banglore')
insert into celebrities values(110,'deepika','padukon',789456789,'mysore')
select * from celebrities

insert into brands values(1001,105,'nike')
insert into brands values(1002,103,'nykaa')
insert into brands values(1003,103,'samsung')
insert into brands values(1004,106,'addidas')
insert into brands values(1005,101,'addidas')
insert into brands values(1006,101,'hotstar')
insert into brands values(1007,null,'gucci')
insert into brands values(1008,107,'denvor')
insert into brands values(1009,null,'sony')
insert into brands values(1010,108,'nike')



select * from brands
insert into bendorse values(1001,105)
insert into bendorse values(1002,103)
insert into bendorse values(1003,103)
insert into bendorse values(1004,106)
insert into bendorse values(1005,101)
insert into bendorse values(1006,101)
insert into bendorse values(1007,null)
insert into bendorse values(1008,107)
insert into bendorse values(1009,null)
insert into bendorse values(1010,108)

create table celebrities_log(celebid int primary key,firstname varchar(15),lastname varchar(15),cphone numeric(10,0),address varchar(20))
create table brands_log(brandid int primary key  ,celebid int  foreign key(celebid) references celebrities(celebid), bname varchar(20))
create table bendorse_log(brandid int  , celebid int ,foreign key(celebid) references celebrities(celebid) ,foreign key(brandid) references brands(brandid))
 
 -- celebrity trigger

create trigger celebinsert on celebrities
for insert as insert into celebrities_log(celebid,firstname,lastname,cphone,address)
select celebid,firstname,lastname,cphone,'done' from inserted
select * from celebrities_log

insert into celebrities values(1011,'ananya','pandey',342897459,'mumbai')

create trigger celebupdate on celebrities
after update as insert into celebrities_log(celebid,firstname,lastname,cphone,address)
select celebid,firstname,lastname,cphone,'data updated' from updated
update celebrities set firstname='abcd' where celebid=102
select * from celebrities


create trigger celebdelete on celebrities
instead of delete as insert into celebrities_log(celebid,firstname,lastname,cphone,address)
select celebid,firstname,lastname,cphone,'deleted' from deleted

-- brands trigger

create trigger brandsinsert on brands
for insert as insert into brands_log(brandid,celebid,bname)
select brandid,celebid,'done' from inserted

select * from brands_log

create trigger brandsupdate on brands
for update as insert into brands_log(brandid,celebid,bname)
select brandid,celebid,'done' from updated

create trigger brandsdelete on brands
instead of delete as insert into brands_log(brandid,celebid,bname)
select brandid,celebid,'done' from deleted

--bendorese trigger

create trigger bendorseInsert on bendorse
for insert as insert into bendorse_log(brandid,celebid)
select brandid,'done' from inserted

create trigger bendorseUpdate on bendorse
for update as insert into bendorse_log(brandid,celebid)
select brandid,'done' from updated

create trigger bendorseDelete on bendorse
instead of delete as insert into bendorse_log(brandid,celebid)
select brandid,'done' from deleted