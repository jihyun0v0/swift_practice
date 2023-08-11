//
//  ViewController.swift
//  HelloWorld
//
//  Created by Jihyun Kyoung on 2023/08/11.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imgview: UIImageView!
    @IBOutlet weak var lbHello: UILabel!
    @IBOutlet weak var txfName: UITextField!
    @IBOutlet weak var btResize: UIButton!
    
    var isZoom = false
    var imgOn: UIImage?
    var imgOff: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgOff = UIImage(named: "/Users/jihyunkyoung/Downloads/bwLP.jpg")
        imgOn = UIImage(named: "/Users/jihyunkyoung/Downloads/clrLP.jpg")
        
        imgview.image = imgOn
    }
    
    @IBAction func btsend(_ sender: Any) {
        lbHello.text = "Hello, " + txfName.text! + "!"
    }
    
    @IBAction func swimageOnOff(_ sender: UISwitch) {
        if sender.isOn {
            imgview.image = imgOn
        }
        else{
            imgview.image = imgOff
        }
    }
    
    @IBAction func btResizeImage(_ sender: UIButton) {
        let scale:CGFloat = 2.0
        var newWidth:CGFloat, newHeight:CGFloat
        
        if(isZoom){
            newWidth = imgview.frame.width/scale
            newHeight = imgview.frame.height/scale
            btResize.setTitle("zoom in", for:.normal)
        }
        else{
            newWidth = imgview.frame.width*scale
            newHeight = imgview.frame.height*scale
            btResize.setTitle("zoom out", for:.normal)
        }
        imgview.frame.size = CGSize(width: newWidth, height: newHeight)
        isZoom = !isZoom
    }
}

