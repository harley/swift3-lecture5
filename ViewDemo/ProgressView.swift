//
//  ProgressView.swift
//  ViewDemo
//
//  Created by Harley Trung on 4/4/16.
//  Copyright © 2016 coderschool.vn. All rights reserved.
//

import UIKit

class ProgressView: UIView {
    var progress: CGFloat = 0 {
        didSet {
            setNeedsDisplay()
        }
    }

    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        let context = UIGraphicsGetCurrentContext()
        let redColor = UIColor.redColor()
        CGContextSetStrokeColorWithColor(context, redColor.CGColor)
        CGContextBeginPath(context)
        CGContextMoveToPoint(context, 0, 0)
        CGContextAddLineToPoint(context, rect.size.width * progress, 0)
        CGContextStrokePath(context)
        CGContextMoveToPoint(context, 0, 1)
        CGContextAddLineToPoint(context, rect.size.width * progress, 1)
        CGContextStrokePath(context)
    }
}
