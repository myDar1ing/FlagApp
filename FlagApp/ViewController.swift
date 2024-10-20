//
//  ViewController.swift
//  FlagApp
//
//  Created by Adilet Kenesbekov on 12.10.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func worldFlagsTapped(_ sender: UIButton) {
           performSegue(withIdentifier: "showWorldFlags", sender: self)
       }

       @IBAction func europeanFlagsTapped(_ sender: UIButton) {
           performSegue(withIdentifier: "showEuropeanFlags", sender: self)
       }

       @IBAction func americanFlagsTapped(_ sender: UIButton) {
           performSegue(withIdentifier: "showAmericanFlags", sender: self)
       }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let destinationVC = segue.destination as? FlagViewController {
                switch segue.identifier {
                case "showWorldFlags":
                    destinationVC.countries = allCountries
                case "showEuropeanFlags":
                    destinationVC.countries = europeanCountries
                case "showAmericanFlags":
                    destinationVC.countries = americanCountries
                default:
                    break
                }
            }
        }
    
}

