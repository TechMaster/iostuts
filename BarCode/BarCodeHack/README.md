# Barcode scanner port từ hypersolo

Ứng dụng này sử dụng thư viện [Bar Code Scanner](https://github.com/hyperoslo/BarcodeScanner)

Khi biên dịch ứng dụng crash với lỗi
*The app's Info.plist must contain an NSCameraUsageDescription key with a string value explaining to the user how the app uses this data.*

Hãy bổ xung key vào trong info.plist như hướng dẫn ở link dưới
https://stackoverflow.com/questions/39465687/nscamerausagedescription-in-ios-10-0-runtime-crash

Mình đã copy toàn bộ code của hypersolo vao thư mục barcode để dễ chỉnh sửa nâng cấp
