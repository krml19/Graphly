//
//  NSViewController+Child.swift
//  Graphly
//
//  Created by Marcin Karmelita on 12/2/17.
//  Copyright © 2017 Marcin Karmelita. All rights reserved.
//

import Cocoa
import SnapKit

extension NSViewController {
    func displayContentController(content: NSViewController, containerView: NSView) {
        containerView.subviews.first?.removeFromSuperview()
        
        if !childViewControllers.contains(content) {
            self.addChildViewController(content)
        }
        
        content.view.frame = containerView.frame
        containerView.addSubview(content.view)
        content.view.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(10)
        }
        view.layout()
    }
}
