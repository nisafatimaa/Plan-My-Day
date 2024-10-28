//
//  AddTaskViewController.swift
//  Plan My Day
//
//  Created by Nisa on 26/10/2024.
//

import UIKit

class AddTaskViewController: UIViewController {

    
    // MARK: - Outlets
    @IBOutlet var lunaMessageImage: UIImageView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet var scrollView : UIScrollView!
    @IBOutlet var view2: UIView!
    @IBOutlet var view3: UIView!
    
    
    // MARK: - properties
    private var frequentTasks : [String] = ["Study","Clean", "Workout", "Cook","Study","Clean", "Workout", "Cook"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showFrequentlyUsedTasks()
        updateScrollViewContentSize()
        
        view2.layer.cornerRadius = 15
        view3.layer.cornerRadius = 15
    }
    
    
    // MARK: - Functions
    private func showFrequentlyUsedTasks() {
        for task in frequentTasks {
            let frequentTaskButton = FrequentTaskButton(frame: CGRect(x: 0, y: 0, width: 46, height: 46))
            frequentTaskButton.configure(with: task)
            stackView.addArrangedSubview(frequentTaskButton)
        }
    }
    
    //updating scrollView size to fit all new tasks
    private func updateScrollViewContentSize() {
        let spacing: CGFloat = stackView.spacing
        let buttonCount = stackView.arrangedSubviews.count
        let buttonSize : CGFloat = 46
        let totalWidth = CGFloat(buttonCount) * buttonSize + CGFloat(buttonCount - 1) * spacing
        
        scrollView.contentSize = CGSize(width: totalWidth, height: scrollView.frame.height)
    }
}
