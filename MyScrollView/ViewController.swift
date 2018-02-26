//
//  ViewController.swift
//  MyScrollView
//
//  Created by KaiChieh on 26/02/2018.
//  Copyright © 2018 KaiChieh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let imageView = UIImageView(image: UIImage(named: "Sample.jpg") )
//    var deviceWidth: CGFloat = 0
//    var deviceHeight: CGFloat = 0
    var deviceWidth: CGFloat {
        return UIScreen.main.bounds.size.width
    }
    var deviceHeight: CGFloat {
        return UIScreen.main.bounds.size.height
    }

    @IBOutlet weak var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
//        deviceWidth = UIScreen.main.bounds.size.width
//        deviceHeight = UIScreen.main.bounds.size.height
        scrollView.frame = CGRect(x: 0, y: 0, width: deviceWidth, height: deviceHeight)
        imageView.frame = scrollView.bounds
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
//        imageView.isUserInteractionEnabled = true
        scrollView.minimumZoomScale = 0.8
        scrollView.maximumZoomScale = 3
        scrollView.addSubview(imageView)
        scrollView.delegate = self
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        deviceWidth = UIScreen.main.bounds.size.width
//        deviceHeight = UIScreen.main.bounds.size.height
        scrollView.frame = CGRect(x: 0, y: 0, width: deviceWidth, height: deviceHeight)
        scrollView.zoomScale = 1
        imageView.frame = scrollView.bounds
    }
    //override cpmputed var
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .all
    }
}

// MARK: - UIScrollViewDelegate
extension ViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("contentSize is \(scrollView.contentSize)")
        print("contentOffset is \(scrollView.contentOffset)")
    }

}

