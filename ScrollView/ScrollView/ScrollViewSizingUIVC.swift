//
//  ScrollViewSizingUIVC.swift
//  ScrollView
//
//  Created by cuongdd on 12/05/2022.
//  Copyright © 2022 duycuong. All rights reserved.
//

import UIKit

class ScrollViewSizingUIVC: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var textField: UITextField! {
        didSet {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 6
            paragraphStyle.lineHeightMultiple = 1.25
            let attributes = [
                NSAttributedString.Key.font: UIFont(name: "PlayfairDisplay-Italic", size: 20)!,
                NSAttributedString.Key.foregroundColor: UIColor.lightGray,
                NSAttributedString.Key.paragraphStyle: paragraphStyle
            ]
            let attributedPlaceholder = NSAttributedString(string: "Nhập tên bài thơ", attributes: attributes)
            textField.attributedPlaceholder = attributedPlaceholder
        }
    }
    @IBOutlet weak var textView: UITextView!
    
    fileprivate lazy var placeholderLabel: UILabel = {
        let textView = UILabel()
        textView.font = UIFont(name: "PlayfairDisplay-Regular", size: 20)
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        placeholderLabel = UILabel()
        placeholderLabel.text = "Enter some text..."
//        placeholderLabel.font = UIFont.italicSystemFont(ofSize: (textView.font?.pointSize)!)
        placeholderLabel.font = UIFont(name: "PlayfairDisplay-Italic", size: 20)
        placeholderLabel.sizeToFit()
        textView.addSubview(placeholderLabel)
        placeholderLabel.frame.origin = CGPoint(x: 5, y: (textView.font?.pointSize)! / 2)
        placeholderLabel.textColor = UIColor.lightGray
        placeholderLabel.isHidden = !textView.text.isEmpty
    }
}

extension ScrollViewSizingUIVC: UITextFieldDelegate {
    
}

extension ScrollViewSizingUIVC: UITextViewDelegate {
    func textViewDidChangeSelection(_ textView: UITextView) {
        placeholderLabel.isHidden = !textView.text.isEmpty
    }
}

extension ScrollViewSizingUIVC: UIScrollViewDelegate {
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        textView.resignFirstResponder()
    }
}
