//
//  XibLoadedView.swift
//  CanHelp
//
//  Created by Александр Хлебников on 22.04.2018.
//  Copyright © 2018 Glos. All rights reserved.
//

import UIKit

class XibLoadedView: UIView {
  var xibName: String {
    assertionFailure("You must override xibName")
    return ""
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    initializeFromXib()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    initializeFromXib()
  }
  
  private func initializeFromXib() {
    let view = loadViewFromNib()
    view.frame = bounds
    view.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
    addSubview(view)
  }
  
  private func loadViewFromNib() -> UIView {
    let bundle = Bundle.main
    let nib = UINib(nibName: xibName, bundle: bundle)
    guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else {
      return UIView()
    }
    
    return view
  }
}
