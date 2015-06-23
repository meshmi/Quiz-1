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
        self.lblQuestion.text = targetQuestionText
        self.btnShowAnswer.enabled = true
        self.btnShowQuestion.enabled = false
    }
    
    @IBAction func onTapShowAnswer(sender: AnyObject) {
        let targetAnswerText = answers[self.currentIndex]
        self.lblAnswer.text = targetAnswerText
        self.currentIndex++
        
        if self.currentIndex == questions.count {
            self.showEndofQuiz()
            self.resetQuiz()
        }
        
        self.btnShowAnswer.enabled = false
        self.btnShowQuestion.enabled = true
    }
    
    func showEndofQuiz() {
        var alert = UIAlertController(title: "Congratulations", message: "You have finished the quiz", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Got it! Start over!", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func resetQuiz() {
        self.currentIndex = 0
        self.lblQuestion.text = "???"
        self.lblAnswer.text = "???"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.btnShowAnswer.enabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
