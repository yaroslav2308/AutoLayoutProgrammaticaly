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
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        let attribitedText = NSMutableAttributedString(string: "Some some some some some some some!", attributes: [.font: UIFont.boldSystemFont(ofSize: 20)])
        
        attribitedText.append(NSAttributedString(string: "\n\n\nSome some some some some some some! Some some some some some some some! Some some some some some some some!", attributes: [.font: UIFont.systemFont(ofSize: 15), .foregroundColor: UIColor.gray]))
        
        textView.attributedText = attribitedText
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        view.addSubview(redSquareImageView)
        view.addSubview(descriptionTextView)
        
        setupLayout()
        
        
        
    }
    
    private func setupLayout() {
        let topImageContainerView = UIView()
        view.addSubview(topImageContainerView)
        
        //enable auto layout
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        //container layout
        topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
        topImageContainerView.addSubview(redSquareImageView)
        
        //red square layout
        redSquareImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        redSquareImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        redSquareImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        
        //text view layout
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        
    }


}

