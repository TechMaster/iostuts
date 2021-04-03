//
//  FilterThumbnailView.swift
//  ImageFilter
//
//  Created by Techmaster on 5/23/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit
import EVGPUImage2
class FilterThumbnailView: UIImageView {
    //Lưu các hiệu ứng filter ảnh. Chỉ được phép hoặc basic_filter hoặc group_filter khác nil
    var basic_filter: BasicOperation? // Loại đơn giản
    var group_filter: OperationGroup? //Loại phức tạp cần gộp nhiều bước filter
    
    convenience init(image: UIImage?, basic_filter: BasicOperation) {
        self.init()
        self.bounds = CGRect(x: 0, y: 0, width: image!.size.width, height: image!.size.height)
        self.basic_filter = basic_filter
        renderThumbnail(image: image)
    }
    
    convenience init(image: UIImage?, group_filter: OperationGroup) {
        self.init(image: image)
        self.group_filter = group_filter
        //Bổ sung lệnh để filter group
    }
    
    func renderThumbnail(image: UIImage?) {
        if basic_filter != nil {
            if let filteredImage = image?.filterWithOperation(basic_filter!) {
                self.image = filteredImage
            }
        }
    }
    
   

}
