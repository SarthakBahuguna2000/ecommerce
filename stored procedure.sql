-- You have to create project for fashion brands. One person can endorse more than one brands you have to create 3 tables one for brand,
 --2nd for celebrity and 3rd for brand endorsement. You have to fill atleast 10 records in each table and you have to find output brands
 -- not endorced by celebrity, common brands endorced by celebrity, brands not endorced by celebrity with stored procedures

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



-- You have to create project for fashion brands. One person can endorse more than one brands you have to create 3 tables one for brand,
 --2nd for celebrity and 3rd for brand endorsement. You have to fill atleast 10 records in each table and you have to find output brands
 -- not endorced by celebrity, common brands endorced by celebrity, brands not endorced by celebrity with stored procedures



 -- solution
 -- brands not endorced by celebrity
create procedure sp_pro1
as begin 
select b.brandid,b.bname,c.firstname from brands as b full join celebrities as c on b.celebid=c.celebid where c.firstname is null  end
 exec sp_pro1


-- create procedure sp_commonBrands
as
begin
select b.bname as 'brands' from brands as b
inner join endorsement as e
on b.bid = e.bid
group by(bname)
having count(bname) > 1
end
create procedure sp_commonBrands
as
begin
select b.bname as 'brands' from brands as b
inner join bendorse as e
on b.brandid = e.brandid
group by(bname)
having count(bname) > 1
end

exec sp_commonBrands