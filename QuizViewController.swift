//
//  QuizViewController.swift
//  Quiz
//
//  Created by Bryan Robinson on 6/8/15.
//  Copyright (c) 2015 Bryan Robinson. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    
    
    let questions: [String] = [
        "What is 7+7",
        "From what is cognac made?",
        "What is the capital of Vermont?"
    ]
    
    let answers: [String] = [
        "14",
        "Grapes",
        "Montpelier"
    ]
    
    var currentIndex: Int = 0
    
    
    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var lblAnswer: UILabel!
    
    @IBOutlet weak var btnShowQuestion: UIButton!
    @IBOutlet weak var btnShowAnswer: UIButton!
    
    
    @IBAction func onTapShowQuestion(sender: AnyObject) {
        let targetQuestionText = questions[self.currentIndex]
        lblQuestion.text = targetQuestionText
        btnShowAnswer.isEnabled = true
        btnShowQuestion.isEnabled = false
    }
    
    @IBAction func onTapShowAnswer(sender: AnyObject) {
        let targetAnswerText = answers[self.currentIndex]
        lblAnswer.text = targetAnswerText
        currentIndex += 1
        
        if self.currentIndex == questions.count {
            showEndofQuiz()
            resetQuiz()
        }
        
        self.btnShowAnswer.isEnabled = false
        self.btnShowQuestion.isEnabled = true
    }
    
    func showEndofQuiz() {
        let alert = UIAlertController(title: "Congratulations", message: "You have finished the quiz", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Got it! Start over!", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func resetQuiz() {
        currentIndex = 0
        lblQuestion.text = "???"
        lblAnswer.text = "???"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.btnShowAnswer.isEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
