create table ��
(
 ��id char(5),
 ���� char(20),
 ����ó char(14),
 ���ϸ��� int,
 �������� int 
)
insert �� values(111,'��̰�','010-23-5645',400,0)
insert �� values(222,'ä���','010-73-1234',860,0)
create table ��������
(
 ��id char(5),
 ���� char(20),
 ����ó char(14)
)

select* from ��
select* from ��������

drop table ��
drop table ��������
drop trigger ��������trg

create trigger ��������trg
on ��
after insert
as
begin
	if  (select �������� from inserted) = 1
		insert �������� 
		select ��id, ����, ����ó from inserted
end

insert �� values (333,'ȫ�浿','010-5588-1234',800,1)
insert �� values (444,'������Ŀ','010-5578-1234',500,0)

select*from �԰�
select*from ��ǰ

drop trigger �԰�trg
drop trigger ��ǰtrg

create trigger �԰�trg
on �԰�
after insert
as
begin
	update ��ǰ 
		set ������ = ������ + (select �԰���� from inserted)
		where ��ǰ�ڵ� = (select ��ǰ�ڵ� from inserted)
end

insert �԰� values('P01','2022/11/16',10)

create trigger ��ǰtrg
on �԰�
after delete
as
begin
	update ��ǰ 
		set ������ = ������ - (select �԰���� from deleted)
		where ��ǰ�ڵ� = (select ��ǰ�ڵ� from deleted)
end

delete from �԰� where �԰��ȣ=3

create trigger ����trg
on �԰�
after update
as
begin
	update ��ǰ set ������ = ������ - (select �԰���� from deleted) + (select �԰���� from inserted)
	where ��ǰ�ڵ� = (select ��ǰ�ڵ� from inserted)--deleted�� �ᵵ �������. �Ѵ� ������ �Ȱ��Ƽ�
end

update �԰� set �԰����=10 where �԰��ȣ=4

select * from ��������
select * from ��ǰ
drop trigger ����trg

create trigger ����trg
on ��������
after update
as
begin
	update ��ǰ set ���� = ���� 
	- (select �������� from deleted) 
	+ (select �������� from inserted)
	where ��ǰ�ڵ� = (select ��ǰ�ڵ� from inserted)
end

update �������� set �������� = 5 where ��ȣ=3