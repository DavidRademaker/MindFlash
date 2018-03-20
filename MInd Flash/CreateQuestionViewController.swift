//
//  CreateQuestionViewController.swift
//  MInd Flash
//
//  Created by David Rademaker on 3/19/18.
//  Copyright © 2018 David Rademaker. All rights reserved.
//

import UIKit

class CreateQuestionViewController: UIViewController {
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var answer1TextField: UITextField!
    @IBOutlet weak var answer2TextField: UITextField!
    @IBOutlet weak var answer3TextField: UITextField!
    @IBOutlet weak var answer4TextField: UITextField!
    @IBOutlet weak var correctAnswerController: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
    }
    

}
