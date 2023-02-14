# 003 - Views & Modifiers

*SwiftUI* được tạo nên với các thành phân View cơ bản đầu tiên. Nên ta sẽ khám phá  chủ đề tiếp theo là **Views & Modifiers**, xem chúng có những gì. Tiến hành chỉnh sửa giao diện cho các View cơ bản trên.

> Bắt đầu thôi!

## Chuẩn bị

### Lý thuyết

* Tạo & Tách View
* Tùy chỉnh với Modifiers
* Action cơ bản
* Custom View
* Custom Style cho View
* Custom Modifiers cho View
* Control cơ bản: Text, Image, TextField, Button ...
* Kết hợp & bố cục các View cơ bản để tạo nên giao diện của một màn hình
* Thay đổi nội dung của View (động) bằng ViewBuilder

### Môi trường

* Xcode 14
* SwiftUI 4
* Swift 5.7

### Tham khảo

* [Creating your UI](https://fxstudio.dev/creating-your-ui-swiftui-notes-2/)
* [Extracting subview](https://fxstudio.dev/extracting-subview-swiftui-notes-5/)
* [Declaring View](https://fxstudio.dev/declaring-view-swiftui-notes-8/)
* [Reusable View](https://fxstudio.dev/reusable-view-swiftui-notes-10/)
* [Basic Layout](https://fxstudio.dev/basic-layout-swiftui-notes-11/)
* [Text](https://fxstudio.dev/text-view-trong-10-phut-swiftui-notes-25/)
* [Image](https://fxstudio.dev/image-view-trong-10-phut-swiftui-notes-26/)
* [TextField](https://fxstudio.dev/basic-textfield-swiftui-notes-27/) & [TextField Style & Modifier](https://fxstudio.dev/textfield-style-modifier-swiftui-notes-28/)
* [Input Control](https://fxstudio.dev/input-controls-swiftui-notes-29/)

---

## Bài 1 - Avatar View

### Yêu cầu

* Tạo mới một project SwiftUI.
* Tạo giao diện với hiện thị một Avatar & Name
	* Image
	* Text
* Vị trí hiển thị Avatar ở chính giữa màn hình
* Chạm vào Avatar thì `print` giá trị của Name

### Mô tả

> *(chưa cập nhật ... )*

## Bài 2 - List Avatar Views

### Yêu cầu

* Tạo một màn hình với giao diện hiển thị 9 Avartar View (ở bài 1) theo dạng ô lưới (collection view)
* Tạo subclass mới cho Avatar View (reuseable view)
* Khi nhấn vào các Avatar View thì hiển thị tên hay index của từng View

### Mô tả

> *(chưa cập nhật ... )*

## Bài 3 - Giao diện cho ứng dụng Calculator

### Yêu cầu

* Tạo một màn hình với giao diện tương tự ứng dụng Calculator trên iOS
* Nhấn vào các Button thì `print` giá trị title của nó

### Mô tả

> *(chưa cập nhật ... )*

## Bài 4 - Xem màu với 3 slider

### Yêu cầu

* Tạo một màn hình với giao diện bao gồm
	* 1 View lớn ở trên với background mặc định
	* 3 views con tiếp theo, sắp xếp từ trên xuống
	* mỗi view con có 1 slider & 1 text để hiển thị giá trị của slider
	* 3 slider đại diện cho 3 giá trị: Red, Green, Blue
* Yêu cầu:
	* Kết hợp 3 giá trị kia để tạo nên màu cho backgroud của View lớn ở trên cùng
	* Khi di chuyển 1 trong các slider thì màu backgrourd của View sẽ thay đổi theo

### Mô tả

> *(chưa cập nhật ... )*

## Bài 5 - Hiển thị các Image

### Yêu cầu

* Tạo một màn hình với 1 Image cơ bản
* Yêu cầu hiển thị cho Image:
	* Full màn hình với `fit` & `fill` mode cho Image
	* Full Safe Area
	* Với size cố định cho Image và theo 2 chế độ `fit` & `fill` cho ảnh
	* Bo tròn ảnh / hiên thị ảnh crop hình tròn & hình elip
	* Hiển thị Text trên ảnh

### Mô tả

> *(chưa cập nhật ... )*

## Bài 6 - TextField Style

### Yêu cầu

* Tạo màn hình với các TextField khác nhau
* Field cơ bản
* Password cơ bản
* TextFiedl có sử dụng place holder
* Tủy biến style của các TextField với:
	* Font
	* Weight
	* Color
	* Alingnments
	* Multi-line
	* Border
	* Background
	* Shadow

### Mô tả

> *(chưa cập nhật ... )*


## Bài 7 - Custom Modifiers

### Yêu cầu

* Tiến hành tạo các Custom Modifiers cho các tùy chỉnh style ở trên
* Áp dụng Modifiers cho nhiều TextField một lúc để tạo nên tính tương đồng trong ứng dụng

### Mô tả

> *(chưa cập nhật ... )*


## Bài 8 - Buttons

### Yêu cầu

* Tao giao diện với nhiều Buttons khác nhau với các sltyle khác nhau.
* Style của Button tương tự như với TextField ở trên
* Custom layout của Button với:
	* 1 icon & 1 title
	* 1 title & 1 sub-title
* Custom Button với 2 kiểu
	* Custom subclass Button
	* Custom modifiers
* Tạo 1 subclass Button với yêu cầu khi tap vào button thì tự động cập nhật title của nó với số lần người dùng tap vào chính nó

### Mô tả

> *(chưa cập nhật ... )*

## Bài 9 - Login Screen

### Yêu cầu

* Tạo một màn hình với giao diện là một màn hình đăng nhập cơ bản
* Bao gồm
	* Banner View với: logo & tên ứng dụng
	* Input View với: 2 TextFields username & password, 2 Buttons login & cancel
	* Footer View với các Buttons các: Forgot Password, Register new account ...
* Yêu cầu chức năng:
	* Validate các TextField với Field rỗng
	* Khi các Field đều được nhập đầy đủ thì Login Button sẽ chuyển từ trạng thái Disable sang Enable
	* Khi nhấn vào Cancel Button thì sẽ xóa dữ liệu trên các TextField
* Thiết kế màn hình login cho `đẹp` nhóe!

### Mô tả

> *(chưa cập nhật ... )*

## Bài 10 - Welcome Screen

### Yêu cầu

* Tạo mới một màn hình Welcome Screen
* Giao diện bao gồm:
	* Text & Image giới thiệu về ứng dụng
	* Start Button
* Yêu cầu chức năng
	* Ban đầu sẽ hiển thị Welcome Screen
	* Kích vào Start Button sẽ hiển thị Login Screen
* Áp dụng ViewBuilder để thay đổi hiển thị. Vì chưa tới bài Navigation nên không được phép sử dụng nó.

### Mô tả

> *(chưa cập nhật ... )*

---

*( Vui lòng sử dụng tài liệu trong repo này với mục đích học tập. Nghiêm cấm việc sử dụng hay lợi dụng cho các mục đích thương mai. Vì một cộng đồng SwiftUI phát triễn vững mạnh. Cảm ơn bạn đã quan tâm tới.)*