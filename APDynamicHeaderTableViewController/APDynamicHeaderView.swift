//
//  APDynamicHeaderView.swift
//
//  Created by Aaron Pang on 2015-04-26.
//  Copyright (c) 2015 Aaron Pang. All rights reserved.
//

import Foundation
import UIKit

class APDynamicHeaderView : UIView {
  
  var contentView = UIView()
  fileprivate let textLabel = UILabel()
  
  // MARK: Lifecycle
  
  /**
  Designated Initializer. Defaults the size of the header view to the expanded size.
  */
  init() {
    super.init(frame: CGRect.zero)
    self.backgroundColor = UIColor(red: 0.2, green: 0.5, blue: 0.9, alpha: 1)
    
    addSubview(contentView)

    contentView.backgroundColor = UIColor.clear
    contentView.translatesAutoresizingMaskIntoConstraints = false
    
    textLabel.translatesAutoresizingMaskIntoConstraints = false
    textLabel.text = "Title"
    textLabel.textAlignment = .center
    textLabel.font = UIFont(name: "Helvetica Neue", size: 25)
    contentView.addSubview(textLabel)
    
    let views = ["contentView" : contentView, "textLabel" : textLabel]
    let metrics = ["statusBarHeight" : UIApplication.shared.statusBarFrame.height]
    addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[contentView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views))
    addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[contentView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views))
    
    contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[textLabel]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views))
    contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-(statusBarHeight)-[textLabel]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views))
  }
  
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)!
  }
  
  func expandToProgress(_ progress : CGFloat) {
    contentView.alpha = progress
    contentView.transform = CGAffineTransform(scaleX: progress, y: progress)
  }
  
}
