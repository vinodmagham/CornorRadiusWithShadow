//
//  ViewController.swift
//  cornerwithShadow
//
//  Created by Kvana Inc 2 on 09/06/16.
//  Copyright © 2016 Kvana Inc 2. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sampleView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sampleView.round([ .TopLeft , .TopRight ,.BottomRight ], radius: 25, borderColor: UIColor .clearColor(), borderWidth: 5)
        
        
        let ScrlViewLayer : CALayer = self.sampleView.layer
        ScrlViewLayer.masksToBounds = false
        ScrlViewLayer.shadowColor = UIColor.lightGrayColor().CGColor
        ScrlViewLayer.shadowOpacity = 1.0
        ScrlViewLayer.shadowRadius = 6.0
        ScrlViewLayer.shadowOffset = CGSizeMake( 0 , 0 )
        ScrlViewLayer.shouldRasterize = true
        ScrlViewLayer.borderColor = UIColor.lightGrayColor().CGColor
        ScrlViewLayer.borderWidth = 3.0
        ScrlViewLayer.shadowPath = UIBezierPath.init(rect: ScrlViewLayer.bounds).CGPath        // shadow
             // Do any additional setup after loading the view, typically from a nib.
    }
    
  

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

