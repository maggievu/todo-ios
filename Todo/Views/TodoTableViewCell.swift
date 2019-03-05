//
//  TodoTableViewCell.swift
//  Todo
//
//  Created by Maggie on 2019-03-04.
//  Copyright © 2019 MidTerm. All rights reserved.
//

import UIKit

class TodoTableViewCell: UITableViewCell {

    @IBOutlet weak var todoTitleLabel: UILabel!
    @IBOutlet weak var todoDescLabel : UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
