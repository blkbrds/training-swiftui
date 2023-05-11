//
//  ExpandableListViewModel.swift
//  WorkingWithList
//
//  Created by Khuyen Dang T.T. VN.Danang on 25/04/2023.
//

import Foundation

final class ExpandableListViewModel: ObservableObject {

    func dummyData() -> [MenuItem] {

        let cake: [MenuItem] = [MenuItem(name: "Bánh quy", image: "cupcake"),
            MenuItem(name: "Bánh sinh nhật", image: "cupcake"),
            MenuItem(name: "Bánh bông lan", image: "cupcake"),
            MenuItem(name: "Bánh xoài", image: "cupcake")]

        let rice: [MenuItem] = [MenuItem(name: "Cơm gà"),
            MenuItem(name: "Cơm tấm"),
            MenuItem(name: "Cơm chiên dương châu"),
            MenuItem(name: "Cơm sườn cốt lết"),
            MenuItem(name: "Cơm sườn non thập cẩm"),
            MenuItem(name: "Cơm thịt kho tiêu"),
            MenuItem(name: "Cơm cá chiên"),
            MenuItem(name: "Cơm thịt kho trứng")]

        let bread: [MenuItem] = [MenuItem(name: "Bánh mì thịt chả"),
            MenuItem(name: "Bánh mì thịt ốp la"),
            MenuItem(name: "Bánh mì chà bông"),
            MenuItem(name: "Bánh mì xíu mại"),
            MenuItem(name: "Bánh mì bánh lọc"),
            MenuItem(name: "Bánh mì chả bò"),
            MenuItem(name: "Bánh mì chả heo"),
            MenuItem(name: "Bánh mì bơ đậu đường")]

        let noodles: [MenuItem] = [MenuItem(name: "Phở gà"),
            MenuItem(name: "Phở bò"),
            MenuItem(name: "Phở nạm"),
            MenuItem(name: "Phở tái")]

        let fastFood: [MenuItem] = [MenuItem(name: "Mì tôm"),
            MenuItem(name: "Gà rán"),
            MenuItem(name: "Xúc xích"),
            MenuItem(name: "Pizza"),
            MenuItem(name: "Hamburger"),
            MenuItem(name: "Kimbap"),
            MenuItem(name: "Snack")]

        let milkTea: [MenuItem] = [MenuItem(name: "Trà sữa trân châu trắng"),
            MenuItem(name: "Trà sữa trân châu đường đen"),
            MenuItem(name: "Trà sữa khoai môn"),
            MenuItem(name: "Trà sữa sương sáo"),
            MenuItem(name: "Trà xoài kem cheese"),
            MenuItem(name: "Trà sữa Oreo Chocolate Cream"),
            MenuItem(name: "Trà sữa Full Topping"),
            MenuItem(name: "Trà sữa Earl Grey")]

        let fruitJuice: [MenuItem] = [MenuItem(name: "Nước ép cốc"),
            MenuItem(name: "Nước ép ổi"),
            MenuItem(name: "Nước chanh"),
            MenuItem(name: "Nước ép thơm"),
            MenuItem(name: "Nước ép cần tây"),
            MenuItem(name: "Nước cam"),
            MenuItem(name: "Nước ép táo"),
            MenuItem(name: "Nước ép lê"),
            MenuItem(name: "Nước ép thanh long"),
            MenuItem(name: "Nước ép dưa hấu"),
            MenuItem(name: "Nước mía"),
            MenuItem(name: "Bơ xay"),
            MenuItem(name: "Nước nha đam")]

        let softDrink: [MenuItem] = [MenuItem(name: "Pepsi"),
            MenuItem(name: "Coca cola"),
            MenuItem(name: "7 Up"),
            MenuItem(name: "Xá xị"),
            MenuItem(name: "Larue"),
            MenuItem(name: "Tiger"),
            MenuItem(name: "Khoán ngọt"),
            MenuItem(name: "Dr Thanh"),
            MenuItem(name: "Trà xanh không độ"),
            MenuItem(name: "Mirinda"),
            MenuItem(name: "Fanta"),
            MenuItem(name: "Sprite")]


        let foods: [MenuItem] = [MenuItem(name: "Cơm", image: "rice", subMenuItems: rice),
            MenuItem(name: "Phở", image: "noodle", subMenuItems: noodles),
            MenuItem(name: "Bánh mì", image: "bread", subMenuItems: bread)]

        let drinks: [MenuItem] = [MenuItem(name: "Trà sữa", image: "milktea", subMenuItems: milkTea),
            MenuItem(name: "Nước ép", image: "juice", subMenuItems: fruitJuice),
            MenuItem(name: "Nước lọc", image: "water"),
            MenuItem(name: "Nước ngọt", image: "soft_drink", subMenuItems: softDrink)]

        let items: [MenuItem] = [MenuItem(dealImage: "deal1", name: "Bánh ngọt", image: "cake", subMenuItems: cake),
            MenuItem(dealImage: "deal2", name: "Đồ ăn", image: "food", subMenuItems: foods),
            MenuItem(dealImage: "deal3", name: "Đồ ăn nhanh", image: "fast_food", subMenuItems: fastFood),
            MenuItem(dealImage: "deal4", name: "Nước uống", image: "drink", subMenuItems: drinks)]

        return items
    }
}
