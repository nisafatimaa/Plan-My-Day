//
//  FrequentTaskButton.swift
//  Plan My Day
//
//  Created by Nisa on 26/10/2024.
//

import UIKit

class FrequentTaskButton: UIView {
    
    private var taskButton: UIButton = {
          let button = UIButton()
          button.translatesAutoresizingMaskIntoConstraints = false
          button.backgroundColor = UIColor.lightPurple
          button.setTitleColor(.black, for: .normal)
          return button
      }()
    
    //delete button
    private var deleteButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "trash"), for: .normal)
        button.tintColor = .red
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //setting task and delete button
    private func setupButton () {
        addSubview(taskButton)
        addSubview(deleteButton)
        
        taskButton.layer.cornerRadius = frame.size.width / 2
        taskButton.clipsToBounds = true
        
        deleteButton.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            taskButton.widthAnchor.constraint(equalTo: self.widthAnchor),
            taskButton.heightAnchor.constraint(equalTo: self.widthAnchor, constant: -4),
            taskButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            taskButton.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            deleteButton.widthAnchor.constraint(equalToConstant: 20),
            deleteButton.heightAnchor.constraint(equalToConstant: 20),
            deleteButton.trailingAnchor.constraint(equalTo: taskButton.trailingAnchor, constant: 8),
            deleteButton.topAnchor.constraint(equalTo: taskButton.topAnchor, constant: -1)
        ])
    }
    
    
    @objc private func deleteButtonTapped() {
    }
    
    //giving title
    func configure(with title: String) {
        taskButton.setTitle(title, for: .normal)
    }
}
