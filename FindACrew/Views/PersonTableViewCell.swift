//
//  PersonTableViewCell.swift
//  FindACrew
//
//  Created by Ben Gohlke on 5/4/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "PersonCell"

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var birthYearLabel: UILabel!

}
