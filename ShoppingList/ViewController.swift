//
//  ViewController.swift
//  ShoppingList
//
//  Created by Hiroaki Mano on 2021/03/29.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    

    //IBOutlets for the textField and tableView in the mainStoryBoard
    
    //@IBOutlet weak var QuantityTextField: UIBarButtonItem!
    @IBOutlet weak var QuantityTextF: UITextField!
    @IBOutlet weak var MyTableView: UITableView!
    @IBOutlet weak var EnterNewItemTextField: UITextField!
    var items : [Item] = []
    let item1 = Item(name: "Math IXL", quantity: 2)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MyTableView.dataSource = self
        
        //Things that go on the first and second row, We can chage the text to anything
        
        //Example
        
        let item1 = Item(name: "Math", quantity: 1)
        let item2 = Item(name: "Humanities", quantity: 1)
        items = [item1, item2]
        
        if let SavedData = UserDefaults.standard.data(forKey: "StoredData") {
            
            if let itemsdecoded = try? JSONDecoder().decode([Item].self, from: SavedData) as [Item] {
                
                
                
                items = itemsdecoded
                
            }
            else {
                
                print("decodingFailed")
                
            }
        }
        
    }
    
    //func for tableview on MainStoryboard
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

           if editingStyle == UITableViewCell.EditingStyle.delete {

               items.remove(at: indexPath.row)

               tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            
            

           }
    }
    

    //This is so the number of rows will be the number of items added on the list so this program dosen't crash
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    // This function is made so the text data is transfered to the
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cellid", for: indexPath)
        
        let currentItem = items[indexPath.row]
        cell.textLabel?.text = currentItem.name
        
        cell.detailTextLabel?.text = " Quantity:\(currentItem.quantity) "
        
       
        
        
        return cell
        
        
    }
    
    //Action+Encode
    
    @IBAction func WhenAddButtonPushed(_ sender: UIBarButtonItem) {
        
        if let newItemName = EnterNewItemTextField.text {
            
            if let itemQuantity = QuantityTextF.text {
                
                if let stringquantity = Int(itemQuantity) {
                    
                    let newItem = Item(name: newItemName, quantity: stringquantity)
                    items.append(newItem)
                    MyTableView.reloadData()
                    
                    if let encoded = try? JSONEncoder().encode(items) {
                        
                        UserDefaults.standard.setValue(encoded, forKey: "StoredData")
                        
                        
                    }
                    
                }
                
                
                
                
                
                
            }
           
            
           
         
            
            
            
        }
        
    }
 //   @IBAction func DeleteButtonPushed(_ sender: Any) {
        
       // if let indexPath = MyTableView.indexPathForSelectedRow {
         //   items.remove(at: indexPath.row)
            
          //  MyTableView.reloadData()
            
        }
        
        
        
        
    
    









