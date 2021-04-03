//
//  DanhBaVC.swift
//  TabBarNavigationController
//
//  Created by Techmaster on 5/21/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit
import Stevia

class DanhBaVC: UIViewController {

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
                    name: "Nguyễn Văn A",
                    short_msg: "0976.839.529",
                    time_before: "",
                    badget: ""),
            Message(avatar: UIImage(named: "ferarrio_ava")!,
                    name: "Nguyễn Văn B",
                    short_msg: "0976.839.529",
                    time_before: "",
                    badget: ""),
            Message(avatar: UIImage(named: "ferarrio_ava")!,
                    name: "Nguyễn Văn C",
                    short_msg: "0976.839.529",
                    time_before: "",
                    badget: "")
        ]
    }

}
extension DanhBaVC: UITableViewDataSource {
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
