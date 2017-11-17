//
//  EProgress.swift
//  EProgress
//
//  Created by 刘真 on 2017/11/17.
//

import UIKit

@IBDesignable

open class EProgress: UIControl {
    
    @IBInspectable public var progress: CGFloat = 0.5 {
        didSet {
            progress = min(progress, 1)
            progress = max(progress, 0)
            setNeedsLayout()
        }
    }

    @IBInspectable public var fullImage: UIImage?
    @IBInspectable public var trackImage: UIImage?
    
    @IBInspectable public var fullColor: UIColor = UIColor.gray
    @IBInspectable public var trackColor: UIColor = UIColor.blue
    
    @IBInspectable public var rounding: Bool = false
    
    private var fullImageView = UIImageView()
    private var trackMask = UIView()
    private var trackImageView = UIImageView()
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        if rounding {
            layer.cornerRadius = frame.height/2.0
            clipsToBounds = true
        }
        
        if fullImageView.superview == nil || trackImageView.superview == nil || trackMask.superview == nil {
            addSubview(fullImageView)
            addSubview(trackMask)
            trackMask.addSubview(trackImageView)
            trackMask.backgroundColor = UIColor.clear
        }
        
        if let f = fullImage {
            fullImageView.image = f
            fullImageView.backgroundColor = UIColor.clear
        }
        else {
            fullImageView.backgroundColor = fullColor
        }
        
        if let t = trackImage {
            trackImageView.image = t
            trackImageView.backgroundColor = UIColor.clear
        }
        else {
            trackImageView.backgroundColor = trackColor
        }
        
        fullImageView.frame = self.bounds
        trackImageView.frame = self.bounds
        trackMask.frame = CGRect(origin: .zero, size: CGSize(width: progress*self.bounds.width, height: self.bounds.height))
        trackMask.clipsToBounds = true
    }
    
    open override var intrinsicContentSize: CGSize {
        if let f = fullImage {
            return f.size
        }
        return CGSize(width: UIViewNoIntrinsicMetric, height: UIViewNoIntrinsicMetric)
    }
    
    open override func prepareForInterfaceBuilder() {
        setNeedsLayout()
    }
}
