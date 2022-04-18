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
    
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = .boldSystemFont(ofSize: 15)
        button.setTitleColor(.gray, for: .normal)
        return button
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = .boldSystemFont(ofSize: 15)
        button.setTitleColor(.red, for: .normal)
        return button
    }()
    
    private let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
        pc.pageIndicatorTintColor = .gray
        pc.currentPageIndicatorTintColor = .red
        pc.translatesAutoresizingMaskIntoConstraints = false
        return pc
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(descriptionTextView)
        
        setupBottomControls()
        
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
    
    private func setupBottomControls() {
        let redView = UIView()
        redView.backgroundColor = .red
        
        let bottomControlsStackView = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackView.distribution = .fillEqually
        
        view.addSubview(bottomControlsStackView)
        
        NSLayoutConstraint.activate([
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }


}

