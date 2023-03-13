# State & Data flow

Tới được đây thì cũng khá là bầm dập rồi. Tuy nhiên, chúng ta mới gọi là làm quen với **SwiftUI** nhóe. Phần bài tập này sẽ tập trung vào dữ liệu. Chủ đề là **State & Data flow**. Đây cũng được xem là trend mới của các nền tảng lập trình hiện tại. Với khái niệm **The single source of truth** sẽ là xuyên suốt trong cả quá trình học và làm *SwiftUI*. Nên đoạn đường đau khổ sẽ bắt đầu từ đây nhóe.

> Bắt đầu thôi!

## Chuẩn bị

### Lý thuyết

* The single source of truth
* State & UserInterface
* Binding
* ObservableObject Protocol
* Published
* Storing Data

### Môi trường

* Xcode 14
* SwiftUI 4
* Swift 5.7

### Tham khảo

* [https://fxstudio.dev/tong-quan-ve-state-data-flow-swiftui-notes-32](https://fxstudio.dev/tong-quan-ve-state-data-flow-swiftui-notes-32)
* [https://fxstudio.dev/state-user-interface-state-swiftui-notes-33/](https://fxstudio.dev/state-user-interface-state-swiftui-notes-33/
)
* [https://fxstudio.dev/observation-swiftui-notes-35/](https://fxstudio.dev/observation-swiftui-notes-35/)

---

## Bài 1 - State

### Yêu cầu

* Tạo mới một project để code gọn hơn
* Làm lại Login Screen với việc áp dụng mô hình **MVC** vào màn hình này
* Tạo file cho **Model** để quản lý & xử lý dữ liệu cho thông tin đăng nhập.
	* Tên file là `DataManager`
	* Lưu trữ 1 danh sách các account có thể đăng nhập được
	* Viết các function để kiểm tra thông tin đăng nhập từ View có phù hợp với danh sách lưu trữ hay không
* View lúc này sẽ bao gồm cả View + Controller.
* Sử dụng các biến State để xử lý các trường hợp
	* Validate các TextField
	* Trạng thái enable/disable các Button Login
	* Kiểm tra dữ liệu với Model

* Yêu cầu nâng cao
	* Việc gọi các function của **DataManager** sẽ là xử lý bất đồng bộ
	* Có thể áp dụng **Combine** hoặc ** async/await**
	* View sẽ hiển thị phù hợp với các trạng thái xử lý dữ liệu
		* *Loading* : hiển thị Indicator
		* *Success* : chuyển sang Home Screen (view trắng)
		* *Failure* : hiển thị Alert

### Mô tả

> *Cập nhật sau*

## Bài 2 - User Interface State

### Yêu cầu

* Tiếp tục với project trên.
* Thêm các màn hình
	* Home Screen : hiển thị thông tin người dùng
	* Edit Screen : cho phép người dùng chỉnh sữa thông tin

* Xử lý việc tương tác từ Login > Home > Edit
* Các UI ở Home sẽ cập nhật thông tin sau khi người dùng chỉnh sửa thông tin tại màn hình Edit Screen. Áp dụng Binding cho các thuộc tính tại Edit Screen

### Mô tả

> *Cập nhật sau*

## Bài 3 - The single source of truth

### Yêu cầu

* Tiếp tục với project trên
* Thêm các màn hình
	* Tutorial Screen : giới thiệu ứng dụng

* Thay đổi Root của ứng dụng (áp dụng việc quản lý Root bằng một object chính, lúc này thể hiện Single source of truth)
	* Lần đầu sử dụng ứng dụng sẽ hiển thị Tutorial Screen trước. Lần thứ 2 sử dụng ứng dụng thì sẽ không hiển thị nữa.
	* Chuyển root từ Tutorial sang Login, khi lướt hết Tutorial
	* Chuyển root từ Login sang Home, khi đăng nhập thành công
	* Chuyển root từ Home sang Login, khi nhấn Logout
	
* Quản lý thông tin người dùng tập trung tại Root, sau đó truyền đi tới các màn hình.
	* Trạng thái anonymous user người dùng ẩn danh khi chưa đăng nhập hoặc lúc logout
	* Trạng thái logined, sẽ cập nhật thông tin người dùng cho object
	* Khi logout, sẽ reset thông tin object & chuyển về trạng thái anonymous user

> Đó là yêu cầu nâng cao về thiết kế & cấu trúc dữ liệu phù hợp với mô hình **The single source of truth** với SwiftUI nhóe.

### Mô tả

> *Cập nhật sau*

## Bài 4 - Observable Object

### Yêu cầu

* Tiếp tục với project trên
* Áp dụng mô hình MVVM cho toàn bộ các màn hình bạn đã tạo *(Login, Home, Edit)*
* ViewModel ở mức basic
	* Lưu trữ dữ liệu
	* Xử lý dữ liệu
	* Tương tác với Model (bất đồng bộ)
* Dữ liệu cho các View sẽ theo cấu trúc (class hoặc struct) nên:
	* Quản lý trạng thái thì sử dụng các State Object. Thiết kế các class với ObservableObject Protocol
	* Sử dụng Published để phục vụ cho Binding đối với các thuộc tính của State Object
	* Binding với các đối tượng khác với ObservarbleObject

### Mô tả

> *Cập nhật sau*

## Bài 5 - Environments

### Yêu cầu

* Tiếp tục với project trên
* Thêm một màn hình là Settings Screen
	* Thêm Setting Screen cho bài 4, để lưu trừ các thông tin cấu hình của người dùng (on/off notificaiton, lưu username/pass ...)
	* Dependency Injection với Environment Object truyền từ Root (ví dụ thông tin profile của người dùng)
	* Sử dụng các Environment Values của hệ thống để tự động cập nhật giao diện phù hợp với từng value. Áp dụng với việc tùy chỉnh bật tắt light mode & dark mode từ Setting Screen.
	
* Cố gắng phân biệt & cách dùng giữa 2 loại Environments
	* @EnvironmentObject --> tự tạo
	* Environment properties --> hệ thống

* Ngoài ra còn các cách custom các Environment properties. Phần này khá là nâng cao. Áp dụng chính vào tùy chỉnh UI hoặc cài đặt các custom view. Tìm hiểu cho biết thôi, chứ chưa yêu cầu trong lớp này.

### Mô tả

> *Cập nhật sau*

## Bài 6 - Storing data

### Yêu cầu

* Bài tập phụ nhưng cũng phải làm để biết SwiftUI cung cấp cho chúng ta các kiểu dữ liệu lưu trữ như thế nào.
* Phân loại dựa vào thời gian lưu trữ:
	* Short-term data: các State Object
	* Long-term data: UserDefault (khai tử với SwiftUI rồi), AppStorage, SceneStorage ...
	
* Áp dụng các cách lưu trữ phù hợp với các object phục vụ các màn hình trong project
	* Settings
	* Change root
	* User
* Kết hợp với Environment Objects để phát huy hết sức mạng của chúng

### Mô tả

> *Cập nhật sau*

---

## Tóm tắt cho The single source of truth

Create and manage values:

* @AppStorage
* @FetchRequest
* @GestureState
* @Namespace
* @NSApplicationDelegateAdaptor
* @Published
* @ScaledMetric
* @SceneStorage
* @State@StateObject
* @UIApplicationDelegateAdaptor

Get values:

* @Binding
* @Environment
* @EnvironmentObject
* @FocusedBinding
* @FocusedValue
* @ObservedObject

> Tham khảo thêm các Property Wrappers trong SwiftUI tại [đây](https://www.hackingwithswift.com/quick-start/swiftui/all-swiftui-property-wrappers-explained-and-compared).

---

*( Vui lòng sử dụng tài liệu trong repo này với mục đích học tập. Nghiêm cấm việc sử dụng hay lợi dụng cho các mục đích thương mai. Vì một cộng đồng SwiftUI phát triễn vững mạnh. Cảm ơn bạn đã quan tâm tới.)*