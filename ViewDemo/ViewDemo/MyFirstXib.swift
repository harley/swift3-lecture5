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
        let nib = UINib(nibName: "MyFirstXib", bundle: nil)
        let objects = nib.instantiateWithOwner(self, options: nil)
        let label = objects[0] as! UILabel
        let view2 = objects[1] as! UIView
        view2.frame.origin.y += 300
        addSubview(label)
        addSubview(view2)
    }
}
