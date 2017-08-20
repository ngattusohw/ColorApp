//
//  UserTableViewCell.swift
//  CVTest
//
//  Created by Joseph Skimmons on 8/20/17.
//  Copyright © 2017 Joseph Skimmons. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    var cellButton: UIButton!
    var cellLabel: UILabel!
    
    init(frame: CGRect, title: String) {
        super.init(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        
        cellLabel.textColor = UIColor.black
        cellLabel.font = //set font here
        
        addSubview(cellLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
}
