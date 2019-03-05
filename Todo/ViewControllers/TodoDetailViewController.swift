//
//  TodoDetailViewController.swift
//  Todo
//
//  Created by Maggie on 2019-03-04.
//  Copyright © 2019 MidTerm. All rights reserved.
//

import UIKit

class TodoDetailViewController: UIViewController {
    
    var todoTitle: String!
    var todoDesc: String!
    
    @IBOutlet weak var todoDescLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        title = todoTitle
        todoDescLabel.text = todoDesc
    }

    override func viewDidLoad() {
        super.viewDidLoad()

//        todoDescLabel.text = todoDesc
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
