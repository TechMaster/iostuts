Target - Action (UIButton, UISwitch, UISlider) vs Protocol - Delegate (UIScrollView, UITableView, UICollectionView, UITextField)

Hứng sự kiện

Khác biệt giữa Target Action vs Protocol Delegate là gì?

1- TA và PD đều để xử lý sự kiện giao diện người dùng tác động.

2- TA và PD đều cần một vật chủ (thường là UIViewController), nhận trách nhiệm hứng sự kiện

3- Trong hàm hứng sự kiện thường có tham số là đối tượng bị tác động.

TA: sender: kiểu

------------------------------
4- Khác nhau:
TA cần có mấy điểm: 
+ @IBOutlet gắn đối tượng giao diện vào một biến trong UIViewController

+ @IBAction đứng trước tên hàm hứng sự kiện của TA
+ Các sự kiện mà TA hứng đơn giản chủ yếu là [Value Changed, Touch Up Inside, Touch Up Outside]


5- PD cần có có Protocol cho từng control khác nhau:
+ UITableView -> UITableViewDataSource / UITableViewDelegate
+ UIScrollView -> UIScrollViewDelegate
+ UITextField -> UITextFieldDelegate
+ UITextView -> UITextViewDelegate
....

Protocol có đặc điểm gì?
+ Required vs Optional
+ Optional có thể thực hiện hoặc không thì tùy.

delagate:
weak open var delegate: UIScrollViewDelegate? // default nil. weak reference

Để adopt một protocol trở thành delegate thì có những cách nào? Có 2 cách:

Cách 1: XYZVC: UIViewController, UIScrollViewDelegate
Cách 2: extension XYZVC: UIScrollViewDelegate

Cách 1 vs cách 2 cách nào hay hơn?
Cách 2 quản lý code tốt hơn, không cần phải tạo thêm một subclass mới mà mở rộng trực tiếp vào class hiện có

