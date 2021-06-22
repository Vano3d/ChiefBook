//
//  ViewController.swift
//  ChiefBook
//
//  Created by Chupinsky Ivan on 21.06.2021.
//

import UIKit

class MainListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let RecipeList = Recipe.getRecipeList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }


}

extension MainListViewController: UITableViewDelegate {
    
}

extension MainListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        RecipeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recipeCell", for: IndexPath)
        
        let recipe = RecipeList[indexPath.row]
        
        return cell
    }
    
    
}
