//
//  FlagViewController.swift
//  FlagApp
//
//  Created by Adilet Kenesbekov on 20.10.2024.
//

import UIKit

class WorldFlagsViewController: FlagViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        countries = allCountries  // Load world countries
        loadNewQuestion()
    }
}

class EuropeanFlagsViewController: FlagViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        countries = europeanCountries  // Load European countries
        loadNewQuestion()
    }
}

class AmericanFlagsViewController: FlagViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        countries = americanCountries  // Load American countries
        loadNewQuestion()
    }
}

class FlagViewController : UIViewController{
    var countries : [Country] = []
    var correctCountry : Country?
    
    @IBOutlet weak var flagImageView: UIImageView!
    
    @IBOutlet var answerButton : [UIButton]!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    func loadNewQuestion() {
        guard let questionCountry = countries.randomElement() else { return }
                        correctCountry = questionCountry
                        // Display the flag image and set the question label.
                        flagImageView.image = questionCountry.flagImage
                        questionLabel.text = "What country does this flag belong to?"

                        // Get 3 incorrect options that are not the correct country.
                        var options = countries.filter { $0.name != questionCountry.name }
                        options.shuffle()
                        options = Array(options.prefix(3))  // Take the first 3 incorrect options.

                        // Adding the correct answer to the options and shuffle again.
                        options.append(questionCountry)
                        options.shuffle()

                        // Assign each option to the corresponding button.
                        for (index, option) in options.enumerated() {
                            answerButton[index].setTitle(option.name, for: .normal)
                        }
        }
    @IBAction func answerButtonTapped(_ sender: UIButton) {
        guard let selectedTitle = sender.title(for: .normal),
              let correctCountry = correctCountry else { return }
        
        if selectedTitle == correctCountry.name {
            showAlert(message: "Correct!")
        } else {
            showAlert(message: "Wrong! The correct answer is \(correctCountry.name).")
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { // slight delay before loading a new question
            self.loadNewQuestion()
            self.answerButton.forEach { $0.isEnabled = true }
            
        }
    }

        func showAlert(message: String) {
            let alert = UIAlertController(title: "Result", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadNewQuestion()
    }
    
    
}
