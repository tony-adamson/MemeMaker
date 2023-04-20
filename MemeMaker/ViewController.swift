//
//  ViewController.swift
//  MemeMaker
//
//  Created by Антон Адамсон on 04.02.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bottomCaptionLabel: UILabel!
    @IBOutlet weak var topCaptionLabel: UILabel!
    @IBOutlet weak var bottomSegmentedControl: UISegmentedControl!
    @IBOutlet weak var topSegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        topSegmentedControl.removeAllSegments()
        for choise in topChoices {
            topSegmentedControl.insertSegment(withTitle: choise.emoji, at: topChoices.count, animated: false)
        }
        topSegmentedControl.selectedSegmentIndex = 0
        topCaptionLabel.text = top1.text
        topSegmentedControl.addTarget(self, action: #selector(topSegmentAction(sender: )), for: .valueChanged)
        
        bottomSegmentedControl.removeAllSegments()
        for choise in bottomChoices {
            bottomSegmentedControl.insertSegment(withTitle: choise.emoji, at: bottomChoices.count, animated: false)
            
        }
        bottomSegmentedControl.selectedSegmentIndex = 0
        bottomCaptionLabel.text = bottom1.text
        bottomSegmentedControl.addTarget(self, action: #selector(bottomSegmentAction(sender: )), for: .valueChanged)
    }

    @IBAction func segmentedControlAction(_ sender: Any) {
    }
    
    @IBAction func dragTopLabel(_ sender: UIPanGestureRecognizer) {
        if sender.state == .changed {
            topCaptionLabel.center = sender.location(in: view)
        }
    }
    
    
    let topChoices = [top1, top2, top3]
    let bottomChoices = [bottom1, bottom2, bottom3]
    
    @objc func topSegmentAction(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: topCaptionLabel.text = top1.text
        case 1: topCaptionLabel.text = top2.text
        case 2: topCaptionLabel.text = top3.text
        default: break
        }
    }
    
    @IBAction func dragBottomLabel(_ sender: UIPanGestureRecognizer) {
        if sender.state == .changed {
            bottomCaptionLabel.center = sender.location(in: view)
        }
    }
    
    
    @objc func bottomSegmentAction(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: bottomCaptionLabel.text = bottom1.text
        case 1: bottomCaptionLabel.text = bottom2.text
        case 2: bottomCaptionLabel.text = bottom3.text
        default: break
        }
    }
}

