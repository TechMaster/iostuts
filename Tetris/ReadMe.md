Để viết spec cho một ứng dụng:

1- Viết tóm tắt ngắn nhất có thể về ứng dụng.
Tetris - xếp gạch

2- Mô tả chi tiết
+ Có những đối tượng nào?
  - Các loại gạch, hình khối khác nhau
  - Đống gạch đã rơi trước đó

+ Người chơi tác động như thế nào?
  - quyệt trái dịch gạch sang trái 1 ô
  - quyệt phải dịch gạch sang phải 1 ô
  - quyệt xuống kéo gạch rơi nhanh hơn 1 ô
  - quyệt trái 2 ngón để xoay gạch ngược chiều kim đồng hồ
  - quyệt phải 2 ngón để xoay gạch thuận chiều kim đồng hồ

 + Nếu gạch rơi chạm vào bất kỳ điểm nào trên đống gạch thì dừng lại, kiểm tra nếu có đủ một hàng gạch được hình thành thì rút bớt hàng gạch đó đi

 + Sự kiện thua xảy ra khi đống gạch chạm lên đỉnh màn hình

 + Thưởng điểm: cứ sau 2-3 lần đủ hàng gạch nếu đống gạch quá cao chương trình động viên người chơi bằng cách rút thêm bớt một hàng gạch dưới cùng.


----------------------------
Phân tích kỹ hơn:

Phần khó nhất ở đây là gì?

1- Làm sao để kiểm tra khi nào gạch chạm vào đống gạch?
2- Xoay gạch theo chiều kim đồng hồ và ngược chiều kim đồng hồ.


----------------------------
Đề xuất ý tưởng
1- Sử dụng mảng hai chiều, các hàng tương ứng với hàng gạch
2- Gạch rơi chạm đống gạch thì append dữ liệu gạch vào đống gạch

Hàng đầu gồm toàn số 1 thực chất là đáy
1,1,1,1,1,1,1,1
1,1,0,0,0,1,1,1
0,1,0,0,0,1,1,1
0,0,0,0,0,1,1,1
0,0,0,0,0,0,0,1
0,0,0,0,0,1,1,1

3- Mô phỏng hình dáng viên gạch bằng mảng 2 chiều 3x3, mỗi phần từ 1 là có gạch, 0 là rỗng.

1,0,0          1,1,1       1,1,1           0,1,0    |    1,1,0    ##
1,0,0 -> L     0,1,0 -> T  0,0,0 -> ---    0,1,0 -> |    1,1,0 -> ##
1,1,1          0,1,1       0,0,0           0,1,0    |    0,0,0 

4- Xử lý trường hợp đống gạch chưa có gì, và các viên gạch bắt đầu rơi chạm đáy, làm sao dừng chúng được?
Cách: hãy luôn tạo một hàng gạch cứng ở dưới đáy cùng. Chúng ta sẽ chỉ tính hàng gạch đủ loại trừ đáy cùng này ra.



