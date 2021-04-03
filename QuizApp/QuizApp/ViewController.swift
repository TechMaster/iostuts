//
//  ViewController.swift
//  QuizApp
//
//  Created by Techmaster on 4/29/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hello")
        /* Kịch bản
         1. Sinh ra một mảng có N phần tử từ 1 đến N
         2. Tạo ra một số ngẫu nhiên index có giá trị trong khoảng 0 đến N-1
         3. Lấy ra phần tử có thứ tự là index
         4. Xóa mảng ở vị trí index
         5. Lập lại bước 2 cho đến khi số phần tử lấy ra là K
        */
        
        /* Các bước làm:
         1. Sinh ra một mảng có N phần tử từ 1 đến N
         Search Google swift generate array from range
         let intArray: [Int] = Array(0...20)
         
         2.Tạo ra một số ngẫu nhiên index có giá trị trong khoảng 0 đến N-1
         "swift random integer in range"
         let number = Int.random(in: 0 ..< 10)
         
         3. Tạo một mảng kết quả tạm thời để rỗng
         var result = [Int]()
         
         4. Tạo một biến i ban đầu bằng 0, mỗi lần lấy random thì tăng lên 1 đơn vị cho đến khi bằng
         số K
         */
      /*  let N: Int = 20
        let K: Int = 5
        
        var intArray: [Int] = Array(0...N)
        print(intArray)
        
        for i in 1...K {
            let index = Int.random(in: 0 ..< N-i)
            var result = [Int]()
            result.append(intArray[index])
            print("\(intArray[index])")
            intArray.remove(at: index) //Xóa phần tự đã được chọn để không bị lặp lại
        }*/
        var result = Set<Int>()
        result.insert(3)
        result.insert(5)
        result.insert(3)
        let inarray = Array(result)
        print(inarray)
        
    }


}

