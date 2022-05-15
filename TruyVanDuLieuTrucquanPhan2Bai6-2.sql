use [70-461]
go


select year(DateOfBirth), max([ẸmployeeNumber]) as MaxEmployeeNumber 
from tblEmployee
group by year(DateOfBirth) -- nhóm từng năm sinh 1 rồi hiện ra những người cùng năm sinh mà có EmployeeNumber lớn nhất
go

create table tblTransaction(
	Amount smallmoney,
	DateOfTransaction smalldatetime,
	[EmployeeNumber] int not null
)
go

insert into [tblTransaction] values
(303.56, '20141014', 458),
(174.45, '20141027', 700)

select * from tblTransaction

truncate table tblTransaction --xóa các hàng và tìm bảng exepting(miễn trừ)

----------------------------------------------------------------
select Department
from
(select Department, count(*) as NumberOfDepartment
from tblEmployee
group by Department) as newTable -- cần phải đặt tên cho bảng con bên trong

-- derived table

-- tạo ra bảng mới dựa trên câu lệnh select
select distinct Department, '' as DepartmentHead
into tblDepartment					--lệnh into để tạo ra 1 bảng
from tblEmployee

--sửa đổi demartmentHead về Nvarchar(20)
drop table tblDepartment

-- tạo bảng mà departmentHead có convert or cast N'' về varchar(20)
select distinct Department, CONVERT(varchar(20),N'') as DepartmentHead
into tblDepartment		
from tblEmployee

-- hoặc sửa bảng 
alter table tblDepartment
alter DepartmentHead varchar(30) null

---------------------------------------------------------------------------
-- cách join 3 bảng

