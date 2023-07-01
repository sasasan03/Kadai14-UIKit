//
//  ViewModel.swift
//  Kadai14-UIKit
//
//  Created by sako0602 on 2023/06/21.
//

import Foundation
//⬇️継承先で新たなオブジェクトを作成するのを防ぐためfinalを付与する。
 final public class MainViewModel {
    //⬇️初期化させない。let mainViewModel2 = MainViewModel()❌できなくなる。
    private init() {}
    
    public static let shared = MainViewModel()
    
    var listitems = [
    ListItem(ischecked: false, name: "朝もく"),
    ListItem(ischecked: true, name: "昼もく"),
    ListItem(ischecked: false, name: "夜もく"),
    ListItem(ischecked: true, name: "深夜もく")
    ]
}
