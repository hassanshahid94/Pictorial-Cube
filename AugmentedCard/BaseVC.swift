//
//  BaseVC.swift
//  AugmentedCard
//
//  Created by Hassan on 24.4.2021.
//  Copyright © 2021 Prayash Thapa. All rights reserved.
//

import UIKit
import RappleProgressHUD

class BaseVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func startLoader()
    {
        RappleActivityIndicatorView.startAnimating(attributes: RappleModernAttributes)
    }
    func stopLoader()
    {
        RappleActivityIndicatorView.stopAnimation()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
