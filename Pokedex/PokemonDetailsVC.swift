//
//  PokemonDetailsVC.swift
//  Pokedex
//
//  Created by Ruslan Sabirov on 2/19/16.
//  Copyright © 2016 Ruslan Sabirov. All rights reserved.
//

import UIKit
import Alamofire

class PokemonDetailsVC: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pokeDescription: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var defenseLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var IDLabel: UILabel!
    @IBOutlet weak var attackLabel: UILabel!
    @IBOutlet weak var nextLevelLabel: UILabel!
    @IBOutlet weak var currentLevelImage: UIImageView!
    @IBOutlet weak var nextLevelImage: UIImageView!
    @IBOutlet weak var mainImage: UIImageView!
        
    var pokemon: Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = pokemon.name.capitalizedString
        mainImage.image = UIImage(named: "\(pokemon.pokedexId)")
        print(pokemon.pokedexId)
        
        pokemon.downloadPokemonDetails { () -> () in
            // this will work after work is done
            self.updateUI()
        }
    }
    
    func updateUI() {
        pokeDescription.text = pokemon.description
        typeLabel.text = pokemon.type
        defenseLabel.text = pokemon.defense
        weightLabel.text = pokemon.weight
        heightLabel.text = pokemon.height
        attackLabel.text = pokemon.attack
        currentLevelImage.image = UIImage(named: "\(pokemon.pokedexId)")
        
        if pokemon.nextEvolutionID == "" {
            nextLevelLabel.text = "No Evolution"
            nextLevelImage.hidden = true
        } else {
            nextLevelImage.image = UIImage(named: "\(pokemon.nextEvolutionID)")
            var str = "Next level: \(pokemon.nextEvolutionTxt)"
            if pokemon.nextEvolutionLevel != "" {
                str += " - LVL \(pokemon.nextEvolutionLevel)"
            }
            nextLevelLabel.text = str
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    

}
