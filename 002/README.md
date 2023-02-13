# 002 - SwiftUI App

Với *SwiftUI*, bạn sẽ tiếp cận với khái niệm **SwiftUI App Life Cycle**. Đây là một trong những thứ quan trọng mà bạn phải năm bắt được. Giúp bạn thoát ly khỏi sự ảnh hưởng của *UIKit* với *AppDelegate Life Cycle* truyền thống.

> Bắt đầu thôi nào!

## Chuẩn bị

### Lý thuyết

* Tìm hiểu về SwiftUI App Life Cycle
* Phân biết giữa UIKit AppDelegate Life Cycle và SwiftUI App Life Cycle
* Theo dõi được các trạng thái trong vòng đời của ứng dụng
* Thao tác với các thành phần quen thuộc liên quan tới App ở mức độ tổng thể chung:
	* Notification
	* AppDelegate Functions
	* Deed Link
	* Alert
* Giới thiệu về Environment Values
* Giới thiệu về State & Binding

### Môi trường

* Xcode 14
* SwiftUI 4
* Swift 5.7

### Tham khảo

* [SwiftUI App Life Cycle](https://fxstudio.dev/swiftui-app-life-cycle-swiftui-notes-6/)
* [Basic Environment values](https://fxstudio.dev/basic-environment-values-swiftui-notes-9/)

---

## Bài 1 - New Life Cycle Apps

### Yêu cầu

* Tạo mới một project SwiftUI. Sử dụng UI Interface là **SwiftUI App Life cycle**
* Print các trạng thái vòng đời của ứng dụng

### Mô tả

> *(chưa cập nhật ... )*

## Bài 2 - Deep Link

### Yêu cầu

* Tiếp tục với project của bài 1
* Cấu hình Deed Link cho project.
* Mở ứng dụng khi load từ một URL trên Web browers
* Lấy được các thông tin trên URL đó và hiển thị nó lên màn hình ứng dụng
* Yêu cầu nâng cao:
	* Lựa chọn hiển thị các màn hình khác nhau dựa vào tham số từ URL
	* Sử dụng @State & @Binding để truyền dữ liệu đi từ App tới View, mà không cần truyền dữ liệu trong quá trình khởi tạo View

### Mô tả

> *(chưa cập nhật ... )*

## Bài 3 - App Delegate

### Yêu cầu

* Sử dụng lại project ở trên
* Tạo thêm file AppDelegate & kế thừa các function của nó
* Kết nối từ file SwiftUI sang file AppDelegate
* Tại các function của AppDelegate, tiến hình print thông tin/tin nhắn ... ra

### Mô tả

> *(chưa cập nhật ... )*

## Bài 4 - Environment Values

### Yêu cầu

* Sử dụng lại hoặc tạo mới một project
* Thiết kế giao diện màn hình với 1 Text (màu sắc, màn nền ...) với 2 chế độ Dark mode & Light Mode
* `#1` Hiển thị giao diện màn hình & Text theo Dark mode hoặc Light mode từ setting của thiết bị
* `#2` Hiển thị giao diện độc lập với chế dộ Dark & Light mode của thiết bị

### Mô tả

> *(chưa cập nhật ... )*

## Bài 5 - Alert

### Yêu cầu

* Sử dụng lại hoặc tạo mới một project
* Hiển thị một Alert đơn giản & nội dung text đơn giản
* Nâng cao
	* Hiển thị Alert có một TextField
	* Khi bấn xác nhận trong Alert (OK/Yes/Done/Submit ...) thì nội dung trong TextField sẽ được hiển thị lên Text trên màn hình
	* Tương tự với kiểu là Action Sheet

### Mô tả

> *(chưa cập nhật ... )*

---

*( Vui lòng sử dụng tài liệu trong repo này với mục đích học tập. Nghiêm cấm việc sử dụng hay lợi dụng cho các mục đích thương mai. Vì một cộng đồng SwiftUI phát triễn vững mạnh. Cảm ơn bạn đã quan tâm tới.)*