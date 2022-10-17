//
//  SecondViewController.swift
//  AssignmentDisplayProductDataAPI
//
//  Created by Mac on 11/10/22.
//

import UIKit
import SDWebImage
class SecondViewController: UIViewController {
    //Create empty variables
    var productImage : URL?
    var productPrice : Float?
    var producDescription : String?
    var ProductCategory : String?
    var productRate : Float?
    var productCount : Int?
@IBOutlet weak var productImageOneView: UIImageView!
@IBOutlet weak var productPriceLabel: UILabel!
@IBOutlet weak var productDescriptionLabel: UILabel!
@IBOutlet weak var productCategoryLabel: UILabel!
    @IBOutlet weak var productRateLabel: UILabel!
    @IBOutlet weak var productCountLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        //Load the function in ViewDidLoad
        dataSecondViewController()
    }
    //create function in bounding label and variable for second view controller
    func dataSecondViewController(){
        productImageOneView.sd_setImage(with: productImage)
        productPriceLabel.text = String(productPrice!)
        productDescriptionLabel.text = producDescription
        productCategoryLabel.text = ProductCategory
        productRateLabel.text = String(productRate!)
        productCountLabel.text = String(productCount!)
    }
    @IBAction func logUotButton(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
 
