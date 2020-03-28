//
//  ViewController.swift
//  UIButtonInsets
//
//  Created by Aurélien COLAS on 28/03/2020.
//  Copyright © 2020 Aurélien COLAS. All rights reserved.
//

import UIKit

enum ControlType: Int, CaseIterable {
    case contentInsetLeft, contentInsetRight, contentInsetTop, contentInsetBottom
    case imageInsetLeft, imageInsetRight, imageInsetTop, imageInsetBottom
    case titleInsetLeft, titleInsetRight, titleInsetTop, titleInsetBottom
}

class ViewController: UIViewController {
    @IBOutlet var horizontalAlignementSegmentedControl: UISegmentedControl!
    @IBOutlet var leftContentInsetLabel: UILabel!
    @IBOutlet var rightContentInsetLabel: UILabel!
    @IBOutlet var topContentInsetLabel: UILabel!
    @IBOutlet var bottomContentInsetLabel: UILabel!
    @IBOutlet var leftContentInsetSlider: UISlider!
    @IBOutlet var rightContentInsetSlider: UISlider!
    @IBOutlet var topContentInsetSlider: UISlider!
    @IBOutlet var bottomContentInsetSlider: UISlider!

    @IBOutlet var leftImageInsetLabel: UILabel!
    @IBOutlet var rightImageInsetLabel: UILabel!
    @IBOutlet var topImageInsetLabel: UILabel!
    @IBOutlet var bottomImageInsetLabel: UILabel!
    @IBOutlet var leftImageInsetSlider: UISlider!
    @IBOutlet var rightImageInsetSlider: UISlider!
    @IBOutlet var topImageInsetSlider: UISlider!
    @IBOutlet var bottomImageInsetSlider: UISlider!

    @IBOutlet var leftTitleInsetLabel: UILabel!
    @IBOutlet var rightTitleInsetLabel: UILabel!
    @IBOutlet var topTitleInsetLabel: UILabel!
    @IBOutlet var bottomTitleInsetLabel: UILabel!
    @IBOutlet var leftTitleInsetSlider: UISlider!
    @IBOutlet var rightTitleInsetSlider: UISlider!
    @IBOutlet var topTitleInsetSlider: UISlider!
    @IBOutlet var bottomTitleInsetSlider: UISlider!

    @IBOutlet var originalButton: UIButton!
    @IBOutlet var modifiedButton: UIButton!
    
    @IBAction func didAlignementValueChange(_ segmentedControl: UISegmentedControl) { didUpdateSegmentedControl(with: segmentedControl.selectedSegmentIndex) }
    @IBAction func didSliderValueChange(_ slider: UISlider) { didUpdate(value: Int(slider.value), for: slider.tag) }
    @IBAction func didTapResetButton(_ sender: Any) { resetInsets() }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        originalButton.backgroundColor = .blue
        originalButton.imageView?.backgroundColor = .red
        originalButton.titleLabel?.backgroundColor = .green
        
        modifiedButton.backgroundColor = .blue
        modifiedButton.imageView?.backgroundColor = .red
        modifiedButton.imageView?.contentMode = .scaleAspectFit
        modifiedButton.titleLabel?.backgroundColor = .green

        initAll()
    }
    
    func initAll() {
        horizontalAlignementSegmentedControl.selectedSegmentIndex = originalButton.contentHorizontalAlignment.rawValue
        leftContentInsetLabel.text = String(Int(modifiedButton.contentEdgeInsets.left))
        rightContentInsetLabel.text = String(Int(modifiedButton.contentEdgeInsets.right))
        topContentInsetLabel.text = String(Int(modifiedButton.contentEdgeInsets.top))
        bottomContentInsetLabel.text = String(Int(modifiedButton.contentEdgeInsets.bottom))
        leftImageInsetLabel.text = String(Int(modifiedButton.imageEdgeInsets.left))
        rightImageInsetLabel.text = String(Int(modifiedButton.imageEdgeInsets.right))
        topImageInsetLabel.text = String(Int(modifiedButton.imageEdgeInsets.top))
        bottomImageInsetLabel.text = String(Int(modifiedButton.imageEdgeInsets.bottom))
        leftTitleInsetLabel.text = String(Int(modifiedButton.titleEdgeInsets.left))
        rightTitleInsetLabel.text = String(Int(modifiedButton.titleEdgeInsets.right))
        topTitleInsetLabel.text = String(Int(modifiedButton.titleEdgeInsets.top))
        bottomTitleInsetLabel.text = String(Int(modifiedButton.titleEdgeInsets.bottom))
    }
    
    func resetInsets() {
        leftContentInsetSlider.value = 0
        rightContentInsetSlider.value = 0
        topContentInsetSlider.value = 0
        bottomContentInsetSlider.value = 0
        leftImageInsetSlider.value = 0
        rightImageInsetSlider.value = 0
        topImageInsetSlider.value = 0
        bottomImageInsetSlider.value = 0
        leftTitleInsetSlider.value = 0
        rightTitleInsetSlider.value = 0
        topTitleInsetSlider.value = 0
        bottomTitleInsetSlider.value = 0
        
        ControlType.allCases.forEach { type in
            didUpdate(value: 0, for: type.rawValue)
        }
    }
        
    func didUpdateSegmentedControl(with index: Int) {
        guard let alignement = UIControl.ContentHorizontalAlignment(rawValue: index) else { return }
        originalButton.contentHorizontalAlignment = alignement
        modifiedButton.contentHorizontalAlignment = alignement
    }

    func didUpdate(value: Int, for sliderTag: Int) {
        switch ControlType(rawValue: sliderTag) {
        case .contentInsetLeft:
            modifiedButton.contentEdgeInsets.left = CGFloat(value)
            leftContentInsetLabel.text = String(value)
        case .contentInsetRight:
            modifiedButton.contentEdgeInsets.right = CGFloat(value)
            rightContentInsetLabel.text = String(value)
        case .contentInsetTop:
            modifiedButton.contentEdgeInsets.top = CGFloat(value)
            topContentInsetLabel.text = String(value)
        case .contentInsetBottom:
            modifiedButton.contentEdgeInsets.bottom = CGFloat(value)
            bottomContentInsetLabel.text = String(value)
        case .imageInsetLeft:
            modifiedButton.imageEdgeInsets.left = CGFloat(value)
            leftImageInsetLabel.text = String(value)
        case .imageInsetRight:
            modifiedButton.imageEdgeInsets.right = CGFloat(value)
            rightImageInsetLabel.text = String(value)
        case .imageInsetTop:
            modifiedButton.imageEdgeInsets.top = CGFloat(value)
            topImageInsetLabel.text = String(value)
        case .imageInsetBottom:
            modifiedButton.imageEdgeInsets.bottom = CGFloat(value)
            bottomImageInsetLabel.text = String(value)
        case .titleInsetLeft:
            modifiedButton.titleEdgeInsets.left = CGFloat(value)
            leftTitleInsetLabel.text = String(value)
        case .titleInsetRight:
            modifiedButton.titleEdgeInsets.right = CGFloat(value)
            rightTitleInsetLabel.text = String(value)
        case .titleInsetTop:
            modifiedButton.titleEdgeInsets.top = CGFloat(value)
            topTitleInsetLabel.text = String(value)
        case .titleInsetBottom:
            modifiedButton.titleEdgeInsets.bottom = CGFloat(value)
            bottomTitleInsetLabel.text = String(value)
        default: break
        }
    }
}

