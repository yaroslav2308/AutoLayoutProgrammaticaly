//
//  PageCell.swift
//  AutoLayoutProgrammatically
//
//  Created by Yaroslav Monastyrev on 21.04.2022.
//

import UIKit

class PageCell: UICollectionViewCell {
    
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        backgroundColor = .white
        setupLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        let topImageContainerView = UIView()
        addSubview(topImageContainerView)
        
        //enable auto layout
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        //container layout
        topImageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        
        topImageContainerView.addSubview(redSquareImageView)
        
        //red square layout
        redSquareImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        redSquareImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        redSquareImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        
//        text view layout
        addSubview(descriptionTextView)
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        descriptionTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        descriptionTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

        
    }
    
    
}
