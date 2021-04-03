//
//  TinNhanVC.swift
//  TabBarNavigationController
//
//  Created by Techmaster on 5/21/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit
import Stevia

class TinNhanVC: UIViewController {
    let table = UITableView()
    let searchbar = SearchBarView()
    
    var messages: [Message]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        view.backgroundColor = UIColor.white
        
        view.sv(
            searchbar,
            table
        )
        
        view.layout(
            |searchbar| ~ 50,
            |table|
        )
        searchbar.Top == view.safeAreaLayoutGuide.Top
        table.Bottom == view.safeAreaLayoutGuide.Bottom
        table.dataSource = self // Cho viewcontroller quyền đổ dữ liệu vào
        table.register(CellMessage.self, forCellReuseIdentifier: "message")
        table.rowHeight = 90.0
    }

    func initData() {
        messages = [
            Message(avatar: UIImage(named: "thuhang")!,
                    name: "Thu Hằng",
                    short_msg: "Nếu có lịch phỏng vấn anh báo em nha",
                    time_before: "2 phút",
                    badget: "2"),
            Message(avatar: UIImage(named: "ferarrio_ava")!,
                    name: "Ferrario",
                    short_msg: "Tối nay đi uống bia anh nha",
                    time_before: "5 phút",
                    badget: ""),
            Message(avatar: UIImage(named: "ferarrio_ava")!,
                    name: "Thu Hằng",
                    short_msg: "Nếu có lịch phỏng vấn anh báo em nha",
                    time_before: "1 phút",
                    badget: "1")
        ]
    }

}

extension TinNhanVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "message", for: indexPath) as! CellMessage
        let message = messages[indexPath.row]       
        cell.setMessage(message: message)
        
        return cell
    }
    
    
}
