//
//  ProductTableViewCell.swift
//  AssignmentDisplayProductDataAPI
//
//  Created by Mac on 11/10/22.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    @IBOutlet weak var productIdLabel: UILabel!
    @IBOutlet weak var productTitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
