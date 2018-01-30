//
//  ImageExtension.swift
//  MinimalAlarm
//
//  Created by Ahmed on 11/28/17.
//  Copyright © 2017 Ahmed. All rights reserved.
//

import Foundation
import UIKit
extension UIImage {
    class func circle(diameter: CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: diameter, height: diameter), false, 0)
        let ctx = UIGraphicsGetCurrentContext()!
        ctx.saveGState()
        
        let rect = CGRect(x: 0, y: 0, width: diameter, height: diameter)
       // ctx.setFillColor(color.cgColor)
        ctx.fillEllipse(in: rect)
        
        ctx.restoreGState()
        let img = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return img
    }
    
        func roundedImageWithBorder(width: CGFloat, color: UIColor) -> UIImage? {
            let square = CGSize(width: min(size.width, size.height) + width * 2, height: min(size.width, size.height) + width * 2)
            let imageView = UIImageView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: square))
            imageView.contentMode = .center
            imageView.image = self
            imageView.layer.cornerRadius = square.width/2
            imageView.layer.masksToBounds = true
            imageView.layer.borderWidth = width
            imageView.layer.borderColor = color.cgColor
            UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, false, scale)
            guard let context = UIGraphicsGetCurrentContext() else { return nil }
            imageView.layer.render(in: context)
            let result = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return result
        }
}
