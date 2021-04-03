# UITextFieldDelegate

1- Nếu trường lỗi thì highlight border của text field lên màu đỏ, focus vào trường đó để người dùng sửa --> Good UX

2- Nếu có thể hãy hiển thị luôn error label ngay dưới text field.

3- Khi nhập xong một trường thì nên tự động chuyển sang trường khác luôn.

4- Trong màn hình hãy giới hạn số lượng trường nhập <= 5 !

4- Chọn chiến thuật validation:
A- Viết một hàm validate tất cả các trường
Cường - Hà - Hào

B- Người dùng nhập đên đấu validate đến đó
Đạt - Tùng - Trung

Có những trường hợp 2-3 trường phụ thuộc vào nhau. pass và re-enter pass
Country -> Province -> City
Gender -> Dress Tyle select
phải dùng cách A.

Gom nhóm tất cả thủ tục validate trong một hàm, dễ bảo trì hơn, dễ đọc code hơn.

Ưu điểm cách B:
- Nhắc người dùng ngay khi nhập
- Nếu viết khéo thì logic validation rất ngắn gọn, có thể đóng gói thành component.

