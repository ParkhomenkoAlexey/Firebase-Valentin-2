//
//  MainViewController.swift
//  IChat
//
//  Created by Алексей Пархоменко on 28.05.2020.
//  Copyright © 2020 Алексей Пархоменко. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var muser: MUser?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
        print(muser?.username)
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
