//
//  ListVCCell.swift
//  DemoList
//
//  Created by Admin on 8/8/17.
//  Copyright © 2017 Sanip. All rights reserved.
//
import UIKit

class ListVCCell: UITableViewCell {

    
    @IBOutlet weak var imgListData: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lbldecription: UILabel!
    @IBOutlet weak var v_Cell: UIView!
    
    @IBOutlet weak var c_imgsize: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        v_Cell.setCornerRadious()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
