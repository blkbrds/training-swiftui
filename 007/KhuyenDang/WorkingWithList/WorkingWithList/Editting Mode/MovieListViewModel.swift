//
//  MovieListViewModel.swift
//  WorkingWithList
//
//  Created by Khuyen Dang T.T. VN.Danang on 27/04/2023.
//

import Foundation

final class MovieListViewModel: ObservableObject {

    private var movies = [Movie(name: "Lật mặt 6"),
        Movie(name: "Con nhót mót chồng"),
        Movie(name: "Đầu gấu đụng đầu đất"),
        Movie(name: "Khắc tinh của quỷ"),
        Movie(name: "Trạm tàu ma"),
        Movie(name: "Phim anh em Super Mario"),
        Movie(name: "Âm vực chết"),
        Movie(name: "Cú úp rổ đầu tiên"),
        Movie(name: "Khế ước"),
        Movie(name: "The Ghost Within"),
        Movie(name: "Theo đuổi huyền thoại"),
        Movie(name: "Siêu lừa gặp siêu lầy"),
        Movie(name: "Ngục tối và rồng"),
        Movie(name: "Chuyện tôi và ma quỷ thành người một nhà"),
        Movie(name: "Tình chị duyên em ")]
    
    func dummyData() -> [Movie] {
        return movies
    }
}
