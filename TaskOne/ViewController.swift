//
//  ViewController.swift
//  TaskOne
//
//  Created by mac on 19/06/2022.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var btnsView: UIView!
    @IBOutlet weak var taskOneBtn: UIButton!
    @IBOutlet weak var taskTwoBtn: UIButton!
    @IBOutlet weak var taskThreeBtn: UIButton!
    @IBOutlet weak var taskFourBtn: UIButton!
    @IBOutlet weak var textView: UITextView!

    let taskExcuter = TaskExcuter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStackView()
    }
    
    func setupStackView() {

        btnsView.layer.borderWidth = 1
        btnsView.layer.borderColor = UIColor.separator.cgColor
        btnsView.layer.cornerRadius = 8
        textView.layer.cornerRadius = 8
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.separator.cgColor
    }
    
    @IBAction func task1Action() {
        selectButton(taskOneBtn)
        unselectButton(taskTwoBtn)
        unselectButton(taskThreeBtn)
        unselectButton(taskFourBtn)
        excuteThread(task: Tasks.Task1)
    }
    
    @IBAction func task2Action() {
        unselectButton(taskOneBtn)
        selectButton(taskTwoBtn)
        unselectButton(taskThreeBtn)
        unselectButton(taskFourBtn)
        excuteThread(task: Tasks.Task2)
    }

    @IBAction func task3Action() {
        unselectButton(taskOneBtn)
        unselectButton(taskTwoBtn)
        selectButton(taskThreeBtn)
        unselectButton(taskFourBtn)
        excuteThread(task: Tasks.Task3)
    }

    @IBAction func task4Action() {
        unselectButton(taskOneBtn)
        unselectButton(taskTwoBtn)
        unselectButton(taskThreeBtn)
        selectButton(taskFourBtn)
        excuteThread(task: Tasks.Task4)
    }
    
    func selectButton(_ button: UIButton) {
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
    }
    
    func unselectButton(_ button: UIButton) {
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)

    }
    
    func excuteThread(task: Tasks) {
        taskExcuter.excute(task: task) { result, value in
            DispatchQueue.main.async {
                var tesksStr = self.textView.text
                self.textView.text = ""
                tesksStr?.append(value)
                self.textView.text = "\(tesksStr ?? "")\n"
            }
        }
    }
}

