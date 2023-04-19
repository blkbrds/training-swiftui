//
//  Setting.swift
//  State&Data Flow
//
//  Created by Khuyen Dang T.T. VN.Danang on 17/04/2023.
//

import SwiftUI

class Setting {
    
    @AppStorage("isNotificationEnabled") var isNotificationEnabled: Bool = false
    @AppStorage("isDarkMode") var isDarkMode: Bool = false
    @AppStorage("isSaveData") var isSaveData: Bool = false
}
