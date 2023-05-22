# Grid Layout

Với các ứng dụng mobile, chúng ta có thể một dạng hiển thị danh sách theo kiểu ô lưới, tương tự như *Collection* View ở *UIKit*. Nó gọi tên chung là **Grid** hay **Grid Layout**. Phần này, các bạn sẽ tiếp tục rèn luyện thêm về mặt UI với **Grid Layout** nhóe. Sẽ có rất nhiều thay đổi so với *iOS*, do đó hay tìm kiếm và tham khảo thêm nhiều nguồn khác nhau.

> Bắt đầu thôi!

## Chuẩn bị

### Lý thuyết

* Grid với VStack & HStack
* Grid & Grid Row
* LazyVGrid & LazyHGrid
* GridItem & Configuring Layout
* Sections & Custom
* Switching Grid Layouts
* Combine Grid Layouts

### Môi trường

* Xcode 14
* SwiftUI 4
* Swift 5.7

### Tham khảo

* [Git Layout](https://fxstudio.dev/swiftui-phan-10-grid-layout/)

## Bài 1 - Grid với VStack & HStack

### Yêu cầu

* Tạo mới một project cho phần bài tập này
* Sử dụng các Stack Container cơ bản là VStack & HStack
* Hãy custom các Cell cho đẹp
* Dữ liệu được lưu ở một Array và hay tạo class/struct cho các item trong Array đó
* Lặp dữ liệu và hiển thị chúng dưới dạng ô lưới, bằng cách kết hợp các VStack & HStack
* Khi nhấn vào các Cell
	* Cell mới nhấn vào sẽ đổi màu
	* Cell đã đổi màu thì sẽ reset về màu đầu tiên

### Mô tả

![0029](../_img/0029.png)

## Bài 2 - Grid & Grid Row

### Yêu cầu

* Tạo mới các màn hình để áp dụng cho các yêu cầu con trong bài tập này
* Sử dụng API mới của SwiftUI 4.0 là Grid & GridRow
* Kết hợp với nhau để tạo ra các bài giao diện như mô tả

### Mô tả

* Yêu cầu 1

![0030](../_img/0030.png)

* Yêu cầu 2

![0031](../_img/0031.png)

* Yêu cầu 3

![0032](../_img/0032.png)

## Bài 3 - LazyVGrid & LazyHGrid

### Yêu cầu

* Tạo mới các màn hình để áp dụng cho các yêu cầu con trong bài tập này
* Sử dụng 2 GridLayout chính đó là: LazyVGrid & LazyHGrid
* Chuẩn bị dữ liệu (struct/class & array)
* Lặp để hiện thị các phần tử lên Grid
* Custom Row
* Thực hiện các yêu cầu con trong từng màn hình khác nhau 

### Mô tả

* Lazy Grid cơ bản

![0033](../_img/0033.png)

* Thay đổi kích thước Row

![0034](../_img/0034.png)

* Spacing

![0035](../_img/0035.png)

![0036](../_img/0036.png)

* LazyHGrid (scroll ngang)

![0037](../_img/0037.png)

## Bài 4 - GridItem & Configuring GridLayout

### Yêu cầu

* Tạo mới các màn hình để áp dụng cho các yêu cầu con trong bài tập này
* Sử dụng thành tạo GridItem trong việc cấu hình giao diện cho Grid
* Tạo các mình hình với các kiểu cấu hình của GridItem

### Mô tả

* Default

![0038](../_img/0038.png)

![0039](../_img/0039.png)

* Flexible

![0040](../_img/0040.png)

* Fixed

![0041](../_img/0041.png)

![0042](../_img/0042.png)

* Adaptive

![0043](../_img/0043.png)

* Mixing

![0044](../_img/0044.png)

## Bài 5 - Sections

### Yêu cầu

* Tạo mới các màn hình để áp dụng cho các yêu cầu con trong bài tập này
* Tiếp tục hiển thị Grid khi dữ liệu được chia thành nhiều Sections
* Áp dụng chung cho cả LazyVGrid & LazyHGrid
* Chuẩn bị dữ liệu
* Custom Row & Section

### Mô tả

* LazyVGrid

![0045](../_img/0045.png)

* LazyHGrid

![0046](../_img/0046.png)

## Bài 6 - Switching Gird Layout

* Tạo một màn hình để thực hiện bài tập này.
* Thay đổi các cấu hình cho Grid Layout của bạn
* Khi nhấn vào Bar Button ở Navigation thì chuyển đổi giao diện lần lượt theo từng cấu hình
* Có hiệu ứng (animation) ở các lần chuyển đổi

### Mô tả

Giao diện sẽ thay đổi lần lượt theo số lượng các Row trong một hàng.

![0047](../_img/0047.png)

![0048](../_img/0048.png)

![0049](../_img/0049.png)

![0050](../_img/0050.png)

![0051](../_img/0051.png)

## Bài 7 - Combine Gird

### Yêu cầu

* Tạo một màn hình để thực hiện bài tập này.
* Thật là tuyệt với khi chúng ta kết hợp các kiểu giao diện lại với nhau.
* 1 màn hình có thể có
	* Nhiều List
	* Nhiều Grid
	* Nhiều List & Grid
	* Mỗi khi xoay màn hình sẽ thay đổi giao diện
* Tham khảo các mô tả ở dưới và hãy làm theo lại theo ý tưởng của tụi em. Nhưng phải đảm bảo các yêu câu cơ bản như trên.

### Mô tả

* Các dạng kết hợp khác nhau

![0052](../_img/0052.png)

![0053](../_img/0053.png)

* Giao diện thay đổi khi xoay màn hình

![0054](../_img/0054.png)

![0055](../_img/0055.png)


---

*( Vui lòng sử dụng tài liệu trong repo này với mục đích học tập. Nghiêm cấm việc sử dụng hay lợi dụng cho các mục đích thương mai. Vì một cộng đồng SwiftUI phát triễn vững mạnh. Cảm ơn bạn đã quan tâm tới.)*