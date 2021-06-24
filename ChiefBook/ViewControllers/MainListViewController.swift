//
//  ViewController.swift
//  ChiefBook
//
//  Created by Chupinsky Ivan on 21.06.2021.
//

import UIKit

class MainListViewController: UITableViewController {



    
    private var recipeList = Recipe.getRecipeList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
    }
}

extension MainListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        recipeList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt
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
// Передаём данные на экран с подробным описанием рецепта
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
    // отображает нужную иконку слева если тапнуть edit. Например, ".delete" = иконка удаления
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    // удаляет ячейку
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        recipeList.remove(at: indexPath.row)
       
        tableView.deleteRows(at: [indexPath], with: .fade)
        
    }

    
    
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        false
    }
    
    
    // метод удаляет и вставляет ячейку, которую схватили и двигают
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        let currentRecipe = recipeList.remove(at: sourceIndexPath.row)
        recipeList.insert(currentRecipe, at: destinationIndexPath.row)
    }
    
    //Отображает штучки справа, которые можно потянуть
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
}
