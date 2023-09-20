//
//  QandA.swift
//  Exercise7
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 20/09/2023.
//

import Foundation

class QandA: Identifiable, Codable {
    var question: String
    var answer: String
    var isExpanded: Bool

    init(question: String, answer: String, isExpanded: Bool = false) {
        self.question = question
        self.answer = answer
        self.isExpanded = isExpanded
    }

    enum CodingKeys: CodingKey {
        case question
        case answer
        case isExpanded
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.question = try container.decode(String.self, forKey: .question)
        self.answer = try container.decode(String.self, forKey: .answer)
        self.isExpanded = try container.decode(Bool.self, forKey: .isExpanded)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(question, forKey: .question)
        try container.encode(answer, forKey: .answer)
        try container.encode(isExpanded, forKey: .isExpanded)
    }
}

extension Optional: RawRepresentable where Wrapped: Codable {
    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let json = String(data: data, encoding: .utf8)
        else {
            return "{}"
        }
        return json
    }

    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
              let value = try? JSONDecoder().decode(Self.self, from: data)
        else {
            return nil
        }
        self = value
    }
}


extension QandA {
    static let listQuestion: [QandA] = [
        .init(question: "Tôi phải làm gì để sử dụng Apple Pay?", answer: "Bạn có thể sử dụng Apple Pay để mua hàng tại cửa hàng, trên trang web và trong ứng dụng. Apple Pay được chấp nhận rộng rãi ở nhiều nơi và là phương thức thanh toán đơn giản, an toàn, bảo mật và riêng tư."),
        .init(question: "Apple Pay bảo mật đến mức độ nào?", answer: "Dùng Apple Pay an toàn hơn so với dùng thẻ tín dụng, thẻ ghi nợ hay thẻ trả trước. Bạn cần có Face ID, Touch ID hoặc mật mã để mua hàng trên iPhone, Apple Watch, Mac hoặc iPad. Số thẻ và danh tính của bạn sẽ không được chia sẻ với bên bán, đồng thời số thẻ thực tế cũng không được lưu trữ trên thiết bị của bạn hay trên máy chủ của Apple.\nKhi bạn thanh toán tại cửa hàng, cả Apple lẫn thiết bị của bạn đều sẽ không gửi số thẻ thực sự của bạn cho bên bán. Khi bạn thanh toán trực tuyến trên Safari hay trong ứng dụng, bên bán sẽ chỉ nhận được thông tin bạn cho phép để điền vào đơn hàng, chẳng hạn như tên, địa chỉ email, địa chỉ xuất hoá đơn và địa chỉ giao hàng của bạn.\nKhi bạn thanh toán bằng thẻ ghi nợ hoặc thẻ tín dụng, Apple sẽ không lưu giữ thông tin giao dịch có liên quan đến bạn."),
        .init(question: "Tôi phải làm gì để thiết lập Apple Pay?", answer: "Thiết lập cực kỳ đơn giản. Bạn chỉ cần thêm thẻ tín dụng, thẻ ghi nợ hoặc thẻ trả trước vào ứng dụng Ví trên iPhone. Và hãy nhớ thêm thẻ của bạn vào bất cứ thiết bị Apple nào khác bạn muốn sử dụng Apple Pay. Apple Pay hoạt động trên iPhone, Apple Watch, Mac và iPad."),
        .init(question: "Những ngân hàng nào hỗ trợ Apple Pay?", answer: "Apple Pay hỗ trợ hầu hết thẻ tín dụng và thẻ ghi nợ được cấp bởi các ngân hàng trên khắp thế giới, và danh sách này sẽ phong phú thêm theo thời gian. Bạn có thể xem tất cả các ngân hàng hỗ trợ Apple Pay tại đây. Nếu thẻ của bạn hiện chưa hỗ trợ Apple Pay, hãy liên hệ với ngân hàng của bạn để biết thêm thông tin."),
        .init(question: "Tôi có bị mất phí khi sử dụng Apple Pay không?", answer: "Không. Apple không tính phí khi bạn sử dụng Apple Pay, dù là thanh toán tại cửa hàng, trực tuyến hay trong ứng dụng."),
        .init(question: "Tôi có thể sử dụng Apple Pay ở nước ngoài không?", answer: "Apple Pay sử dụng được ở các quốc gia và khu vực hỗ trợ thanh toán không tiếp xúc. Hãy hỏi thăm ngân hàng của bạn để xác nhận và tìm hiểu về các khoản phí mà ngân hàng có thể tính khi bạn sử dụng dịch vụ này ở nước ngoài."),
        .init(question: "Làm sao để doanh nghiệp của tôi chấp nhận Apple Pay?", answer: "Nếu doanh nghiệp của bạn đã chấp nhận phương thức thanh toán bằng thẻ tín dụng hoặc thẻ ghi nợ, bạn chỉ cần liên hệ nhà cung cấp dịch vụ thanh toán để bắt đầu chấp nhận Apple Pay. Nếu bạn muốn chấp nhận Apple Pay trên trang web hoặc trong ứng dụng của bạn, hãy truy cập trang Apple Pay dành cho nhà phát triển."),
        .init(question: "Làm sao để tôi cho khách hàng biết rằng tôi chấp nhận Apple Pay?", answer: "Hãy tải về biểu tượng Apple Pay và gắn trong email, dán trên màn hình của thiết bị thanh toán, đặt trên trang web hay trong ứng dụng của bạn. Bạn cũng có thể đặt đề-can Apple Pay để dán trên cửa sổ và máy tính tiền ở cửa hàng.")
    ]
}
