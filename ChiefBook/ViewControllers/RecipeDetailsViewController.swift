//
//  ViewController.swift
//  ChiefBook
//
//  Created by Chupinsky Ivan on 21.06.2021.
//

import UIKit

class RecipeDetailsViewController: UIViewController {

    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var recipeDifficulty: UILabel!
    @IBOutlet weak var recipeDescription: UITextView!
    
    var recipe: Recipe?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        recipeTitle.text = recipe?.title
        recipeDifficulty.text = recipe?.difficulty
        recipeDescription.text = recipe?.description
    }

}
