use HowKteam
go

sửa 1 chút để thực hành git

<<<<<<< HEAD
ko biết coonflic 
=======
cố ý để conflic 
>>>>>>> 5b83370aa97d6aaf2d593f0008f2bf2b97f6498a


-- khi có nhu cầu duyệt từng record của bảng. với mỗi record có kết quả xử lý riêng thì dùng cursos

-- declare <tên con trỏ> cursor for < câu select>
-- open <tên con trỏ>

-- fetch next from <tên con trỏ> into <  danh sách các biến tương ứng kết quả truy vấn>

-- while @@fetch_status = 0
-- begin 
-- câu lệnh thực hiện
-- fetch next lại lần nữa
-- fetch next from <tên con trỏ> into < danh sách các biến tương ứng kết quả truy vấn>
-- end

-- close <tên con trỏ>
-- deallocate <tên con trỏ>
--------------------------------------------------

-- từ tuổi của giáo viên 
-- Nếu lớn hơn 40 thì cho lương là 2500
-- Nếu nhỏ hơn 40 và lớn hơn 30 thì cho lương là 2000
-- ngược lại thì lương là 1500

select * from dbo.GIAOVIEN


-- lấy ra danh sách maGV kèm tuổi đưa vào contro có tên là GaoVienCursor
declare GiaoVienCursor cursor for select MaGV, year(getdate()) - year(NGsinh) from dbo.GIAOVIEN

open GiaoVienCursor

declare @MaGV char(10)
declare @tuoi int

fetch next from GiaoVienCursor into @maGV, @tuoi

while @@FETCH_STATUS = 0
begin
	if @tuoi > 40
	begin 
		update dbo.GIAOVIEN set LUONG = 2500 where MAGV = @MaGV
	end
	else 
	if @tuoi > 30
	begin
		update dbo.GIAOVIEN set LUONG = 2000 where MAGV = @MaGV
	end
	else 
	begin
		update dbo.GIAOVIEN set LUONG = 1500 where MAGV = @MaGV
	end

	fetch next from GiaoVienCursor into @maGV, @tuoi
end

close GiaoVienCursor
deallocate GiaoViencursor
