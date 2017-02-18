//
//  ViewController.swift
//  MarsRovers
//
//  Created by Jan Vrzal on 18.02.17.
//  Copyright © 2017 Jan Vrzal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let button: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 400, width: 100, height: 100))
        button.backgroundColor = .green
        button.setTitle("Button", for: .normal)
        return button
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 20, y: 20, width: 250, height: 200))
        imageView.backgroundColor = .red
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = .white
        
        
        button.addTarget(self, action: #selector(buttonPushed), for: .touchUpInside)
        
        view.addSubview(button)
        view.addSubview(imageView)
        
        PhotoModel.shared.getData()
    }
    
    func buttonPushed(){
        let photoData = PhotoModel.shared.data
        
        let url = URL(string: photoData[0].imgURL)
        
        let data = try? Data(contentsOf: url!)
        
        imageView.image = UIImage(data: data!)
    }
}

