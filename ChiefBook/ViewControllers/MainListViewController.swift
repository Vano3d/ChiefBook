//
//  ViewController.swift
//  ChiefBook
//
//  Created by Chupinsky Ivan on 21.06.2021.
//

import UIKit

class MainListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    private var recipeList = Recipe.getRecipeList()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }


}


extension MainListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "recipeCell",
            for: indexPath
        )
        let recipe = recipeList[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        
        content.text = recipe.title
        content.secondaryText = recipe.difficulty
        
        cell.contentConfiguration = content
        
        return cell
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        recipeList.count
    }
}

