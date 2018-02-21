//
//  ViewController.swift
//  Quizzler
//
//  Created by Karthik Chowdary on 31/12/2017.
//  Copyright (c) 2017 Karthik Chowdary. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    var score : Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextQuestion()
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1{
            pickedAnswer = true
        }
        else if sender.tag == 2{
            pickedAnswer = false
        }
        checkAnswer()
        questionNumber = questionNumber + 1
        nextQuestion()
    }
    
    
    func updateUI() {
        scoreLabel.text = "Score :\(score)"
        if questionNumber < 13{
        progressLabel.text = "\(questionNumber + 1)/13"
        }
        else{
         progressLabel.text = "\(questionNumber)/13"
        }
        progressBar.frame.size.width = (view.frame.size.width)/13 * CGFloat(questionNumber + 1)
    }
    

    func nextQuestion() {
        if questionNumber < 13 {
            self.questionLabel.text = self.allQuestions.list[self.questionNumber].questionText
        }
        else {
            let alert = UIAlertController(title: "Awesome", message: "You have successfully completed the quiz. Do you want to start over?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in
                self.startOver()
            })
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
        updateUI()
    }
    
    
    func checkAnswer() {
        let correctAnswer = allQuestions.list[questionNumber].answer
        if pickedAnswer == correctAnswer {
            ProgressHUD.showSuccess("Correct")
            score += 1
        }
        else{
            ProgressHUD.showError("Wrong")
        }
        
    }
    
    
    func startOver() {
        questionNumber = 0
        score = 0
        nextQuestion()
       
    }
    

    
}
