//
//  ViewController.swift
//  AutoLayoutProgrammatically
//
//  Created by Yaroslav Monastyrev on 17.04.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let redSquareImageView: UIImageView = {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 200, height: 200))
        let redSquareImage = renderer.image { ctx in
            ctx.cgContext.setFillColor(UIColor.red.cgColor)

            let rectangle = CGRect(x: 0, y: 0, width: 200, height: 200)
            ctx.cgContext.addRect(rectangle)
            ctx.cgContext.drawPath(using: .fillStroke)
        }
        
        let imageView = UIImageView(image: redSquareImage)
        
        //this enables autolayout for imageView
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Some some some some some some some!"
        textView.font = .boldSystemFont(ofSize: 20)
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(redSquareImageView)
        view.addSubview(descriptionTextView)
        
        setupLayout()
        
        
        
    }
    
    private func setupLayout() {
        //red square layout
        redSquareImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        redSquareImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        redSquareImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        redSquareImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        //text view layout
//        descriptionTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        descriptionTextView.topAnchor.constraint(equalTo: redSquareImageView.bottomAnchor, constant: 50).isActive = true
//        descriptionTextView.widthAnchor.constraint(equalToConstant: 400).isActive = true
//        descriptionTextView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        descriptionTextView.topAnchor.constraint(equalTo: redSquareImageView.bottomAnchor, constant: 50).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        
    }


}

