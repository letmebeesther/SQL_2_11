create table 고객
(
 고객id char(5),
 고객명 char(20),
 연락처 char(14),
 마일리지 int,
 뉴스레터 int 
)
insert 고객 values(111,'김미경','010-23-5645',400,0)
insert 고객 values(222,'채경란','010-73-1234',860,0)
create table 뉴스레터
(
 고객id char(5),
 고객명 char(20),
 연락처 char(14)
)

select* from 고객
select* from 뉴스레터

drop table 고객
drop table 뉴스레터
drop trigger 뉴스레터trg

create trigger 뉴스레터trg
on 고객
after insert
as
begin
	if  (select 뉴스레터 from inserted) = 1
		insert 뉴스레터 
		select 고객id, 고객명, 연락처 from inserted
end

insert 고객 values (333,'홍길동','010-5588-1234',800,1)
insert 고객 values (444,'마더퍼커','010-5578-1234',500,0)

select*from 입고
select*from 상품

drop trigger 입고trg
drop trigger 반품trg

create trigger 입고trg
on 입고
after insert
as
begin
	update 상품 
		set 재고수량 = 재고수량 + (select 입고수량 from inserted)
		where 상품코드 = (select 상품코드 from inserted)
end

insert 입고 values('P01','2022/11/16',10)

create trigger 반품trg
on 입고
after delete
as
begin
	update 상품 
		set 재고수량 = 재고수량 - (select 입고수량 from deleted)
		where 상품코드 = (select 상품코드 from deleted)
end

delete from 입고 where 입고번호=3

create trigger 수정trg
on 입고
after update
as
begin
	update 상품 set 재고수량 = 재고수량 - (select 입고수량 from deleted) + (select 입고수량 from inserted)
	where 상품코드 = (select 상품코드 from inserted)--deleted를 써도 상관없다. 둘다 내용이 똑같아서
end

update 입고 set 입고수량=10 where 입고번호=4

select * from 기증내역
select * from 물품
drop trigger 기증trg

create trigger 기증trg
on 기증내역
after update
as
begin
	update 물품 set 수량 = 수량 
	- (select 기증수량 from deleted) 
	+ (select 기증수량 from inserted)
	where 물품코드 = (select 물품코드 from inserted)
end

update 기증내역 set 기증수량 = 5 where 번호=3