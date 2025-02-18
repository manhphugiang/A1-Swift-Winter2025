//
//  ViewControllerThree.swift
//  A1_ManhPhuGiang
//
//  Created by ManhPhu Giang on 2025-02-17.
//

import Foundation
import UIKit

class ViewControllerThree: UIViewController {
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerTextField: UITextField!

    var correctAnswer: Int = 0
    var isCorrectAnswer: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        generateNewQuestion()
    }

    func generateNewQuestion() {
        let num1 = Int.random(in: 1 ... 10)
        let num2 = Int.random(in: 1 ... 10)

        questionLabel.text = "What is \(num1) + \(num2)?"
        correctAnswer = num1 + num2
    }

    @IBAction func submitAnswer(_: UIButton) {
        let userAnswer = Int(answerTextField.text ?? "") ?? 0
        let isCorrect = (userAnswer == correctAnswer)
        performSegue(withIdentifier: "goToVCFour", sender: isCorrect)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToVCFour",
           let vcFour = segue.destination as? ViewControllerFour
        {
            vcFour.isCorrectAnswer = sender as? Bool ?? false
        }
    }
}
