//
//  LaunchVC.swift
//  InterviewTask
//
//  Created by Amit Gohel on 06/09/22.
//

import UIKit

class LaunchVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "idHomeVC")as! HomeVC
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    

   

}
