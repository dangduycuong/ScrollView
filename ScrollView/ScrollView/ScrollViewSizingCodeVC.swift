//
//  ScrollViewSizingCodeVC.swift
//  ScrollView
//
//  Created by cuongdd on 12/05/2022.
//  Copyright © 2022 duycuong. All rights reserved.
//

import UIKit
import Material

class ScrollViewSizingCodeVC: UIViewController {
    
    fileprivate lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.delegate = self
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    fileprivate lazy var textView: UITextView = {
        let textView = UITextView()
        textView.delegate = self
        textView.isScrollEnabled = false
//        textView.font = UIFont(name: "PlayfairDisplay-Regular", size: 20)
        //HP001_Kieu2_5H.TTF
        textView.font = UIFont(name: "HLHOCTRO", size: 20)
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        view.layout(scrollView)
            .topSafe().left().bottomSafe().right()
        
        scrollView.layout(textView)
            .top(16).left(16).bottom(16).right(16)
            .width(view.bounds.size.width - 32)
        
        let hight = NSLayoutConstraint(item: textView, attribute: .width, relatedBy: .greaterThanOrEqual, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 0)
        textView.addConstraints([hight])
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "textView here"
    }
    
    private func viewCha() -> UIView {
        /*
         NSLayoutConstraint có các thành phần như autolayout
         layout kích thước và vị trí như storyboard
         - tỉ lệ của contrainst
         - tỉ lệ của size
         - chú ý vào relatedBy
         */
        let newView = UIView()
        newView.backgroundColor = UIColor.red
        view.addSubview(newView)
        
        newView.translatesAutoresizingMaskIntoConstraints = false
        let horizontalConstraint = NSLayoutConstraint(item: newView, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        let verticalConstraint = NSLayoutConstraint(item: newView, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0)
        let widthConstraint = NSLayoutConstraint(item: newView, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.greaterThanOrEqual, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100)
        let heightConstraint = NSLayoutConstraint(item: newView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.greaterThanOrEqual, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 10)
        view.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
        
        
        let phoneTextField = UITextField()
        newView.layout(phoneTextField)
            .top().left().bottom().right()
        
        return newView
    }
    
}

extension ScrollViewSizingCodeVC: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        
        return true
    }
}

extension ScrollViewSizingCodeVC: UIScrollViewDelegate {
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        textView.resignFirstResponder()
    }
}
