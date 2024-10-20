//
//  Model.swift
//  FlagApp
//
//  Created by Adilet Kenesbekov on 20.10.2024.
//

import Foundation
import UIKit

struct Country {
    let name : String
    let flagImage : UIImage
    let continent : String
}

struct Continent {
    let name : String
    let countries : [Country]
}

struct Question {
    let flag : UIImage
    let correctAnswer : Country
    let options : [Country]
}

let usa = Country(name: "USA", flagImage: UIImage(named: "usa.jpeg")!, continent: "America")
let canada = Country(name: "Canada", flagImage: UIImage(named: "canada.jpeg")!, continent: "America")
let brazil = Country(name: "Brazil", flagImage: UIImage(named: "brazil.jpeg")!, continent: "America")
let mexico = Country(name: "Mexico", flagImage: UIImage(named: "mexico.jpeg")!, continent: "America")

let france = Country(name: "France", flagImage: UIImage(named: "france.jpeg")!, continent: "Europe")
let germany = Country(name: "Germany", flagImage: UIImage(named: "germany.jpeg")!, continent: "Europe")
let italy = Country(name: "Italy", flagImage: UIImage(named: "italy.jpeg")!, continent: "Europe")
let spain = Country(name: "Spain", flagImage: UIImage(named: "spain.png")!, continent: "Europe")

let china = Country(name: "China", flagImage: UIImage(named: "china.jpeg")!, continent: "Asia")
let japan = Country(name: "Japan", flagImage: UIImage(named: "japan.jpeg")!, continent: "Asia")

let europe = Continent(name: "Europe", countries: [france, germany, italy, spain])
let america = Continent(name: "America", countries: [usa, canada, brazil, mexico])

let allCountries: [Country] = [usa, canada, brazil, france, germany, italy, china, japan, mexico, spain] 
let europeanCountries: [Country] = europe.countries
let americanCountries: [Country] = america.countries
