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
    @IBOutlet weak var answer1Button: UIButton!
    @IBOutlet weak var answer2Button: UIButton!
    @IBOutlet weak var answer3Button: UIButton!
    @IBOutlet weak var answer4Button: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    var questionArray = [Question]()
    var askedQuestions = [Question]()
    
    var colors = [#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1), #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1), #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)]
    
    var score  = 0

    var displayedQuestion: Question?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answer1Button.layer.cornerRadius = 5
        answer1Button.clipsToBounds = true
        
        answer2Button.layer.cornerRadius = 5
        answer2Button.clipsToBounds = true
        
        answer3Button.layer.cornerRadius = 5
        answer3Button.clipsToBounds = true
        
        answer4Button.layer.cornerRadius = 5
        answer4Button.clipsToBounds = true
        
        addQuestionButton.layer.cornerRadius = 5
        addQuestionButton.clipsToBounds = true
        
        resetButton.layer.cornerRadius = 5
        resetButton.clipsToBounds = true
        
        loadQuestions()
        generateQuestionText()
        
        scoreLabel.text = "Score: \(score)"
        }
        func loadQuestions() {
            let question1 = Question(questionText: "What is color is the sky", answers: ["Green", "Purple", "Blue", "Yellow"], correctAnswer: 2)
            
            let question2 = Question(questionText: "What is the color of grass", answers: ["Grey", "Pink", "Red", "Green"], correctAnswer: 3)
            
            let question3 = Question(questionText: "What color is the moon", answers: ["White", "Orange", "Black", "Teal"], correctAnswer: 0)
            
            questionArray.append(question1)
            questionArray.append(question2)
            questionArray.append(question3)
    }
        
        func generateAnswerButtons(question: Question, colorSelction: [UIColor]) {
            var colorArray = colorSelction
            var questionAnswers = question.answers
            for i in 0...3 {
                let randomAnswer = Int(arc4random_uniform(UInt32(questionAnswers.count)))
                let randomColor = Int(arc4random_uniform(UInt32(colorArray.count)))
                switch i {
                case 0 :
                    answer1Button.setTitle(questionAnswers[randomAnswer], for: .normal)
                    answer1Button.backgroundColor = colorArray[randomColor]
                case 1:
                    answer2Button.setTitle(questionAnswers[randomAnswer], for: .normal)
                    answer2Button.backgroundColor = colorArray[randomColor]
                case 2:
                    answer3Button.setTitle(questionAnswers[randomAnswer], for: .normal)
                    answer3Button.backgroundColor = colorArray[randomColor]
                case 3:
                    answer4Button.setTitle(questionAnswers[randomAnswer], for: .normal)
                    answer4Button.backgroundColor = colorArray[randomColor]
                default:
                    return
                }
                questionAnswers.remove(at: randomAnswer)
                colorArray.remove(at: randomColor)
                
            }
        }
        
        func generateQuestionText() {
            scoreLabel.text = "Score: \(score)"
            let randomQuestionIndex = Int(arc4random_uniform(UInt32(questionArray.count)))
            let currentQuestion = questionArray[randomQuestionIndex]
            askedQuestions.append(currentQuestion)
            displayedQuestion = currentQuestion
            questionLabel.text = currentQuestion.questionText
            questionArray.remove(at: randomQuestionIndex)
            generateAnswerButtons(question: currentQuestion,colorSelction: colors)
           
            
        }
    func gameOver() {
        let alertView = UIAlertController(title: "Game Over!", message: "Your score was \(score)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Play Again!", style: .default, handler: { action
            in
           self.questionArray = self.askedQuestions
            self.askedQuestions = []
            self.generateQuestionText()
        })
        alertView.addAction(okAction)
        
        self.present(alertView, animated: true, completion: nil)
        score = 0
    }
    
    
    @IBAction func resetButtonTapped(_ sender: Any) {
        let alertView = UIAlertController(title: "RESET", message: "Are you sure you want to reset the game?", preferredStyle: .alert)
        
        let yesAction = UIAlertAction(title: "Yes!", style: .default, handler: { action in
           self.questionArray = self.askedQuestions
           self.score = 0
            self.askedQuestions = []
            self.generateQuestionText()
            
        })
        let noAction = UIAlertAction(title: "No!", style: .default, handler: { action in self.dismiss(animated: true, completion: nil)
            
        })
        
        alertView.addAction(yesAction)
        alertView.addAction(noAction)
        self.present(alertView, animated: true, completion: nil)
        
    }
    
    
    @IBAction func answerButtonTapped(_ sender: Any) {
        let button = sender as! UIButton
        if button.title(for: .normal) == displayedQuestion!.answers[(displayedQuestion!.correctAnswer)] {
            let alertView = UIAlertController(title: "Correct!", message: "You got the answer right, good job!", preferredStyle: .alert)
            score += 1
            let okAction = UIAlertAction(title: "Okay!", style: .default, handler: { action
                in
                if self.questionArray.count != 0 {
                self.generateQuestionText()
                } else {
               self.gameOver()
                }
                
            })
            alertView.addAction(okAction)
            
            self.present(alertView, animated: true, completion: nil)
        } else {
            let alertView = UIAlertController(title: "Wrong!", message: "You got the answer wrong!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Okay!", style: .default, handler: { action in
                if self.questionArray.count != 0 {
                    self.generateQuestionText()
                } else {
                    self.gameOver()
                }
            })
            alertView.addAction(okAction)
            
            self.present(alertView, animated: true, completion: nil)
        }
    }
}





