//
//  ViewController.swift
//  AssignmentDisplayProductDataAPI
//
//  Created by Mac on 11/10/22.
//

import UIKit

class ViewController: UIViewController {
    //Create empty arary
    var products = [Product]()
    @IBOutlet weak var productTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        productTableView.delegate = self
        productTableView.dataSource = self
        //Reload function
        downloadJSONDATA ()
        }
        //Create urlString function
    func downloadJSONDATA(){
        let urlString = "https://fakestoreapi.com/products"
        //Convert urlString in URL
        let url = URL(string: urlString)
        
        URLSession.shared.dataTask(with: url!) { data,response,error in
            if(error == nil){
                //Conditional statement
                do{
                    let jsonDecoder = JSONDecoder()
                    self.products = try jsonDecoder.decode([Product].self,from: data!)
                    DispatchQueue.main.async {
                        self.productTableView.reloadData()
                    }
                }catch{
                    print("Error")
                }
            }
        }.resume()
    }
}
//Give UITableViewDataSource property
extension ViewController : UITableViewDataSource{
    //Count array in row using numberOfRowsInSection function
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.productTableView.dequeueReusableCell(withIdentifier: "ProductCells", for: indexPath) as! ProductTableViewCell
        cell.productIdLabel.text = String(products[indexPath.row].id)
        cell.productTitleLabel.text = products[indexPath.row].title
    return cell
}
}
//Give UITableViewDelegate property
extension ViewController : UITableViewDelegate{
    //Select row and go Second View Controller using didSelectRowAt function
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let secondVeiwController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
            secondVeiwController.productImage = products[indexPath.row].image
            secondVeiwController.productPrice = products[indexPath.row].price
            secondVeiwController.producDescription = products[indexPath.row].description
            secondVeiwController.ProductCategory = products[indexPath.row].category
            secondVeiwController.productRate = products[indexPath.row].rate
            secondVeiwController.productCount = products[indexPath.row].count
            self.navigationController?.pushViewController(secondVeiwController, animated: true)
        }
        //Set the size in row using heightForRowAt function
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            200
        }
    }
