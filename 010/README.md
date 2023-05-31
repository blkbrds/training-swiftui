# Connect API

Chúc mừng bạn đã vượt qua khá nhiều thử thách về mặt giao diện lẫn dữ liệu trong nền tảng SwiftUI. Phần bài tập này, bạn cần phải tương tác với server để lấy và hiển thị dữ liệu lên ứng dụng SwiftUI. Sẽ có những cách mới & những cách cũ và bạn cần phải hiểu được bản chất của chúng, để sử dụng cho hợp lý. Nhưng mà, chúng ta sẽ áp dụng Combine và Concurrency mới trong Swift 5.5, để phát huy thế mạnh của hệ sinh tái nền tảng Apple nhóe.

> Bắt đầu thôi!

## Chuẩn bị

### Lý thuyết

* URLSession & DataTask
* Completion Handler
* URLSession with async/await
* Combine handler
* Parse Data
* Downloader
* CoreAPI
* Actor & MainActor

### Môi trường

* Xcode 14
* SwiftUI 4
* Swift 5.7

### Tham khảo

* [Combine vs. UIKit – Networking](https://fxstudio.dev/combine-vs-uikit-networking/)
* [Combine vs. UIKit – Fetching Data from API](https://fxstudio.dev/combine-vs-uikit-fetching-data-from-api/)
* [async/await to Fetch REST API](https://fxstudio.dev/async-await-to-fetch-rest-api-swift-5-5/)
* [SwiftUI - Fetching Data to List from API](https://fxstudio.dev/fetching-data-to-list-from-api-swiftui-notes-44/)
* [Core API là gì?](https://fxstudio.dev/basic-ios-tutorial-core-api/)

## Bài 1 - Networking

### Yêu cầu

* Tạo mới một project cho phần bài tập này. Và tạo mới một màn hình để tương tác với API
* Không cần áp dụng mô hình **MVC** hay **MVVM**
* Không cần viết Model hay DataManager để xử lý tương tác với API. Viết thêm function trực tiếp vào View.
* Giao diện List đơn giản không cần Custom Row
* Sử dụng URLSession để thực hiện việc tương tác
* Parse dữ liệu ở mức cơ bản, không cần tạo đối tượng
* Tự lựa chọn phương pháp **callback** phù hợp (như: closure, delegate, async ...)

> Tham khảo [The Cocktail DB](https://www.thecocktaildb.com/api.php) để lấy các API free nhóe!

### Mô tả

> Tự sáng tạo giao diện nhóe!

## Bài 2 - Completion Handling

### Yêu cầu

* Tạo mới một màn hình với 1 danh sách *(List & Grid)*
* Áp dụng **MVVM** vào việc quản lý dữ liệu và tương tác với Model
* Cần tạo một Model với tên là **ApiManager** để quản lý việc tương tác với các API URL
* Sử dụng **closure** để thực hiện **callback** theo kiểu **Completion Handling** với kết quả trả về là **Result Type*** (success hoặc failure)*
* Thiết kế **class/struct** cho các Object được **Parse** ra từ dữ liệu trả về.
* Phần **Decode** thì comform **Codable Protocol**, cấm làm rườm rà phần này.

> Tham khảo [The Cocktail DB](https://www.thecocktaildb.com/api.php) để lấy các API free nhóe!

### Mô tả

> Tự sáng tạo giao diện nhóe!

## Bài 3 - Async/Await Handling

### Yêu cầu

* Tạo mới một màn hình và thực hiện tương tự như bài 2
* Thay vì sử dụng **callback** với **closure**, hãy áp dụng **async/await** trong việc tương tác với API
* Xử lý dữ liệu
* Quản lý việc cập nhật ở Main, nếu phần tương tác API không biết xử lý theo cách mới (tức là không async/await được 100%)

> Tham khảo [The Cocktail DB](https://www.thecocktaildb.com/api.php) để lấy các API free nhóe!

### Mô tả

> Tự sáng tạo giao diện nhóe!

## Bài 4 - Error Handling

### Yêu cầu

* Tạo mới một màn hình để thực hiện bài tập này.

* Về mặt giao diện:
	* Hiển thị đầy đủ các trạng thái: **loading, fetched, failure**.
	* Với **loading**: hiển thị indicator hoặc HUB
	* Với **fetched**: hiển thị danh sách dạng List hoặc Grid. Có custom row đẹp.
	* Với **failure**: hiển thị Alert

* Về mặt coding:
	* Nâng cấp từ các Model riêng lẻ tương tác với từng API thành một CoreAPI hoàn chỉnh
	* CoreAPI xử lý chính phần core tương tác
	* Tái sử dụng được với các API khác nhau
	* Có thể áp dụng 1 trong 2 cách **callback** hay **async/await**

* Về mặt Error Handling
	* Define Error
	* Phần biệt và bắt lỗi có thể phát sinh theo thứ tự: Lỗi URL > Lỗi Connection > Lỗi Response > Lỗi Data > Lỗi Parse
	* Có `re-connect` lại nếu phát sinh lỗi. Tối đa 3 lần, khi đó mới cho cả tiến trình fail. Hãy áp dụng kiến thức RxSwift hoặc Combine vào đây.

> Tham khảo [The Cocktail DB](https://www.thecocktaildb.com/api.php) để lấy các API free nhóe!

### Mô tả

> Tự sáng tạo giao diện nhóe!

## Bài 5 - Connect URLs API

### Yêu cầu

* Tiếp tục tạo mới một màn hình và áp dung CoreAPI ở trên vào

* Về mặt giao diện:
	* Hiển thị đầy đủ các trạng thái: **loading, fetched, failure**.
	* Với **loading**: hiển thị indicator hoặc HUB
	* Với **fetched**: hiển thị danh sách dạng List hoặc Grid. Có custom row đẹp. Hiển thị thông tin chi tiết của từng item được lấy về.
	* Với **failure**: hiển thị Alert
	
* Về mặt xử lý
	* Lần 1: gọi API lấy danh sách item của 1 category
	* Lần 2: gọi nhiều lần API để lấy thông tin chi tiết của từng item
	* Nếu việc lấy thông tin của item nào gặp lỗi thì hãy loại item đó ra khỏi danh sách
	* Cả 2 lần được thực hiện trong cùng 1 lần request

> Tham khảo [The Cocktail DB](https://www.thecocktaildb.com/api.php) để lấy các API free nhóe!

### Mô tả

> Tự sáng tạo giao diện nhóe!

## Bài 6 - Group APIs

### Yêu cầu

* Tiếp tục tạo mới một màn hình và áp dung CoreAPI ở trên vào

* Về mặt giao diện:
	* Hiển thị đầy đủ các trạng thái: **loading, fetched, failure**.
	* Với **loading**: hiển thị indicator hoặc HUB
	* Với **fetched**: hiển thị danh sách dạng List hoặc Grid. Có custom row đẹp. Có nhiều sections cho từng loại items được lấy về từ nhiều APIs.
	* Với **failure**: hiển thị Alert

* Về mặt xử lý:
	* Gọi một lúc nhiều link API khác nhau
	* Khi tất cả được xử lý thành công thì mới hiện thị ra giao diện
	* Hãy áp dụng mọi kiến thức bạn có được để xử lý bài tập này. Ví dụ như: DispatchGroup, Group Task, Asynchronous Sequence ...

> Tham khảo [The Cocktail DB](https://www.thecocktaildb.com/api.php) để lấy các API free nhóe!

### Mô tả

> Tự sáng tạo giao diện nhóe!

## Bài 7 - Downloader

### Yêu cầu

* Tạo mới một màn hình hiển thị một danh sách với dữ liệu được lấy từ API
* Hãy tạo một class/struct với tên là **Downloader** để thực hiện việc tải ảnh từ một URL
* **Custom Row** có xử lý việc download image từ URL của item được lấy về.
* **Custom Row** có áp dụng đầy đủ việc quản lý **State** khi tương tác *(tức là có loading, có success và có failure)*
* Áp dụng tất cả các kiến thức ở trên, để thực hiện một cách mượt mà nhất

* Yêu cầu xử lý
	* Hiển thị danh sách phải mượt mà
	* Khi scroll danh sách thì ảnh download không chớp không giật và không load lại

> Nếu thấy bài tập dễ quá thì hay thử custom một bộ cache image trên bộ nhớ nhóe

> Tham khảo [The Cocktail DB](https://www.thecocktaildb.com/api.php) để lấy các API free nhóe!

### Mô tả

> Tự sáng tạo giao diện nhóe!

---

*( Vui lòng sử dụng tài liệu trong repo này với mục đích học tập. Nghiêm cấm việc sử dụng hay lợi dụng cho các mục đích thương mai. Vì một cộng đồng SwiftUI phát triễn vững mạnh. Cảm ơn bạn đã quan tâm tới.)*