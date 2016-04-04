//
//  MyFirstXib.swift
//  ViewDemo
//
//  Created by Harley Trung on 4/4/16.
//  Copyright © 2016 coderschool.vn. All rights reserved.
//

import UIKit

class MyFirstXib: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
    }

    func initSubviews() {
        // code to load subviews from nib here
        // ...
    }
}
