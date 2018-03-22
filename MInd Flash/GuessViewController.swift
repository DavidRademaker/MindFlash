//
//  GuessViewController.swift
//  MInd Flash
//
//  Created by David Rademaker on 3/19/18.
//  Copyright © 2018 David Rademaker. All rights reserved.
//

import UIKit

class GuessViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var addQuestionButton: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    
    var questionArray = [Question]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        func loadQuestions() {
            let question1 = Question(questionText: "What is color is the sky", answers: ["Green", "Purple", "Blue", "Yellow"], correctAnswer: 2)
            
            let question2 = Question(questionText: "What is the color of grass", answers: ["Grey", "Pink", "Red", "Green"], correctAnswer: 3)
            
            let question3 = Question(questionText: "What color is the moon", answers: ["White", "Orange", "Black", "Teal"], correctAnswer: 0)
            
            questionArray.append(question1)
            questionArray.append(question2)
            questionArray.append(question3)
        }
        
        func generateQuestion() {
            let randomQuestionIndex = Int(arc4random_uniform(UInt32(questionArray.count - 1)))
        }
        
    }
    
    @IBAction func resetButtonTapped(_ sender: Any) {
    }
    
    @IBAction func answerButtonTapped(_ sender: Any) {
        let button = sender as! UIButton
        print(button.tag)
    }
    
    
}
