//
//  ViewController.swift
//  HackingWithSwiftCapstoneProject2
//
//  Created by user208023 on 10/17/22.
//

import UIKit

class ViewController: UITableViewController {
    
    private var shoppingList = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItem))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(clearList))
        title = "Shopping List"
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = shoppingList[indexPath.row]
        
        return cell
    }
    
    @objc func addItem() {
        let ac = UIAlertController(title: "Add Item to Shopping List", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let addItemAction = UIAlertAction(title: "Add Item", style: .default) { [weak self, weak ac] _ in
            guard let item = ac?.textFields?[0].text else { return }
            self?.shoppingList.insert(item, at: 0)
            let itemIndexPath = IndexPath(row: 0, section: 0)
            self?.tableView.insertRows(at: [itemIndexPath], with: .automatic)
        }
        
        ac.addAction(addItemAction)
        present(ac, animated: true)
    }
    
    @objc func clearList() {
        shoppingList = []
        tableView.reloadData()
    }
    
    


}

