//
//  ViewController.swift
//  MarsRovers
//
//  Created by Jan Vrzal on 18.02.17.
//  Copyright © 2017 Jan Vrzal. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let leftButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .green
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.addTarget(self, action: #selector(leftButtonPushed), for: .touchUpInside)
        button.clipsToBounds = true
        return button
    }()
    
    let rightButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .green
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.addTarget(self, action: #selector(rightButtonPushed), for: .touchUpInside)
        button.clipsToBounds = true
        return button
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        return imageView
    }()
    
    let cameraNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Front Hazard Avoidance Camera"
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setView()
        PhotoModel.shared.getData()
    }
    
    func leftButtonPushed() {
        
    }
    
    func rightButtonPushed() {
        let photoData = PhotoModel.shared.data
        
        let url = URL(string: photoData[0].imgURL)
        
        let data = try? Data(contentsOf: url!)
        
        imageView.image = UIImage(data: data!)
    }
    
    func setView() {
        view.backgroundColor = .white
        
        view.addSubview(leftButton)
        view.addSubview(rightButton)
        view.addSubview(imageView)
        view.addSubview(cameraNameLabel)
        
        createConstraints()
    }
    
    func createConstraints() {
        cameraNameLabel.snp.makeConstraints{ make in
            make.top.equalTo(view).offset(self.navigationController!.navigationBar.frame.height + cameraNameLabel.frame.height + 40)
            make.centerX.equalTo(view)
        }
        
        imageView.snp.makeConstraints{ make in
            make.top.equalTo(cameraNameLabel.snp.bottom).offset(20)
            make.leading.equalTo(view).offset(5)
            make.trailing.equalTo(view).offset(-5)
            make.height.equalTo(200)
        }
        
        leftButton.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(40)
            make.leading.equalTo(10)
            make.height.equalTo(100)
            make.width.equalTo(100)
        }
        
        rightButton.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(40)
            make.trailing.equalTo(-10)
            make.height.equalTo(100)
            make.width.equalTo(100)
        }
    }
}

