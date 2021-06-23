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
        
        navigationItem.leftBarButtonItem = editButtonItem
        
    }

}

extension MainListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("Ты тапнул на меня!")
    }
}

extension MainListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        recipeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt
                indexPath: IndexPath) -> UITableViewCell {
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: "cell",
                    for: indexPath
                )
        let recipe = recipeList[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        
        content.text = recipe.title
        content.secondaryText = recipe.difficulty
        
        
        cell.contentConfiguration = content
        
        return cell
    }
    
}
// Передаём данные на экран с подробным опианием рецепта
extension MainListViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? RecipeDetailsViewController,
              let indexPath = tableView.indexPathForSelectedRow
        else { return }
        
        let recipe = recipeList[indexPath.row]
        vc.recipe = recipe
    }
}



extension MainListViewController {
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        print("123")
    }
    
    
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        false
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        let currentRecipe = recipeList.remove(at: sourceIndexPath.row)
        recipeList.insert(currentRecipe, at: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    
}
