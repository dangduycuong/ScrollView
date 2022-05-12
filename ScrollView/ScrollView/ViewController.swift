//
//  ViewController.swift
//  ScrollView
//
//  Created by duycuong on 1/16/19.
//  Copyright © 2019 duycuong. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var photoImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 5.0
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Home"
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return photoImage
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapedToScrollViewByCode(_ sender: UIButton) {
        title = ""
        let vc = ScrollViewSizingCodeVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func tapedToScrollViewByUI(_ sender: Any) {
        title = ""
        let vc = storyboard?.instantiateViewController(identifier: "ScrollViewSizingUIVC") as! ScrollViewSizingUIVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

