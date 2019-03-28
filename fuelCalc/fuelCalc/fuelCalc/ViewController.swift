//
//  ViewController.swift
//  fuelCalc
//
//  Created by Alp Zerey on 23.03.2019.
//  Copyright © 2019 Alp Zerey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var moneyText = UITextField()
    var birimText = UITextField()
    var kmText = UITextField()
    
    var framewidth = Int()
    var frameheight = Int()
    var backgroundImage = UIImage(named: "background.JPG")
    var blurrView = UIView()
    var textLabel = UILabel()
    var blurrviewSecond = UIView()
    var calcButton = UIButton()
    var backButton = UIButton()
    
    var tuketim = UILabel()
    var literFin = UILabel()
    var toplamLitre = UILabel()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        framewidth = Int(view.frame.width)
        frameheight = Int(view.frame.height)
        moneyText = createTextField(textfield: moneyText , yvar:50)
        birimText = createTextField(textfield: birimText , yvar:100)
        kmText = createTextField(textfield: kmText, yvar: 150)
        
        toplamLitre = createLabel(label: toplamLitre, text: "Km/₺ :", yVar: 50)
        tuketim = createLabel(label: tuketim, text: "Km/₺ :", yVar: 100)
        literFin = createLabel(label: literFin, text: "OrtTük/100 : ", yVar: 150)
       
        //Background Ready
        blurrViewAdd()
        //Labels
        self.view.addSubview(createLabel(label: UILabel(), text: "Verilen Ücret:", yVar: 50))
        self.view.addSubview(createLabel(label: UILabel(), text: "Birim Fiyatı:", yVar: 100))
        self.view.addSubview(createLabel(label: UILabel(), text: "Gidilen Yol:", yVar: 150))
        
        //TextBoxes
        self.view.addSubview(moneyText)
        self.view.addSubview(birimText)
        self.view.addSubview(kmText)
        buttonCreate()
        calcLabelCreate()
        self.view.addSubview(blurrviewSecond)
        
        self.view.addSubview(textLabel)
        
        blurrviewSecond.layer.opacity = 0
        createBackButton()
        self.view.addSubview(backButton)
        self.view.addSubview(tuketim)
        self.view.addSubview(literFin)
        self.view.addSubview(toplamLitre)
        backButton.layer.opacity = 0
        tuketim.layer.opacity = 0
        literFin.layer.opacity = 0
        toplamLitre.layer.opacity = 0
    }
    
    func createTextField(textfield : UITextField , yvar : Int)->UITextField
    {
        
        textfield.frame = CGRect(x: framewidth/2, y: yvar, width: framewidth/2-20, height: frameheight/20)
        textfield.placeholder = "Sadece Sayı"
        textfield.font = UIFont.systemFont(ofSize: 13)
        textfield.borderStyle = UITextField.BorderStyle.roundedRect
        textfield.autocorrectionType = UITextAutocorrectionType.no
        textfield.keyboardType = UIKeyboardType.decimalPad
        textfield.returnKeyType = UIReturnKeyType.done
        textfield.clearButtonMode = UITextField.ViewMode.whileEditing
        textfield.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textfield.textAlignment = .center
        
        
        return textfield
        
    }
    
    func createBackButton()
    {
        backButton.frame = CGRect(x: framewidth/2-60, y: frameheight/2-50, width: 120, height: 40)
        
        backButton.backgroundColor = .white
        backButton.setTitle("Tamam", for: .normal)
        backButton.setTitleColor(.black, for: .normal)
        backButton.addTarget(self, action: #selector(buttonActionDone), for: .touchUpInside)
        backButton.layer.cornerRadius = 5
        backButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75).cgColor
        backButton.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        backButton.layer.shadowOpacity = 1.0
        backButton.layer.shadowRadius = 2.5
        backButton.layer.masksToBounds = false
        backButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12.0)
        
        
    }
    
    func calcLabelCreate()
    {
        textLabel.frame = CGRect(x: 10, y: 220, width: framewidth-20, height: frameheight/16)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.textAlignment = .center
        textLabel.textColor = UIColor.white
        textLabel.font = UIFont.boldSystemFont(ofSize: 15.0)
        textLabel.text = ""
    }
    
    
    func createLabel(label : UILabel , text : String , yVar : Int) -> UILabel
    {
        label.frame = CGRect(x: 20, y: yVar, width: framewidth/2-20, height: frameheight/16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 15.0)
        label.text = text
        return label
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle
    {
        return .lightContent
    }
    
    func blurrViewAdd()
    {
        self.view.backgroundColor = UIColor(patternImage: backgroundImage!)
        let blurEfect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        blurrView = UIVisualEffectView(effect: blurEfect)
        blurrView.frame = CGRect(x: 0, y: 0, width: framewidth, height: frameheight)
        blurrView.layer.cornerRadius = 0
        blurrView.layer.opacity = 0.99
        blurrView.layer.masksToBounds = true
        
        blurrviewSecond = UIVisualEffectView(effect: blurEfect)
        blurrviewSecond.frame = CGRect(x: 0, y: 0, width: framewidth, height: frameheight)
        blurrviewSecond.layer.cornerRadius = 0
        blurrviewSecond.layer.opacity = 0.99
        blurrviewSecond.layer.masksToBounds = true
        self.view.addSubview(blurrView)
        
    }
    
    func buttonCreate()
    {
        calcButton.frame = CGRect(x: framewidth/2-60, y: frameheight/2-50, width: 120, height: 40)
        calcButton.backgroundColor = .white
        calcButton.setTitle("Hesapla", for: .normal)
        calcButton.setTitleColor(.black, for: .normal)
        calcButton.addTarget(self, action: #selector(buttonActionCalc), for: .touchUpInside)
        calcButton.layer.cornerRadius = 5
        calcButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75).cgColor
        calcButton.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        calcButton.layer.shadowOpacity = 1.0
        calcButton.layer.shadowRadius = 2.5
        calcButton.layer.masksToBounds = false
        calcButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12.0)
        
        self.view.addSubview(calcButton)
    }
    
    @objc func buttonActionCalc(sender: UIButton!)
    {
        //print("Button tapped")
        let birim = (birimText.text! as NSString).floatValue
        let yol = (kmText.text! as NSString).floatValue
        let para = (moneyText.text! as NSString).floatValue
        var litre = Float()
        
        
        if(para != 0.0 && yol != 0.0 && birim != 0.0)
        {
            litre = para/birim
            blurrviewSecond.layer.opacity = 1
            backButton.layer.opacity = 1
            tuketim.layer.opacity = 1
            literFin.layer.opacity = 1
            toplamLitre.layer.opacity = 1
            toplamLitre.text = "Top/Litre : "+String(String(litre).prefix(4))
            tuketim.text = "Km/₺ : "+String(String(para/yol).prefix(4))
            literFin.text = "OrtTük/100 : "+String(String((litre*100)/yol)).prefix(4)
            
            self.view.endEditing(true)
        
        }
        else
        {
            if(textLabel.text == "")
            {
                textLabel.text = "İstenilen Değerleri Giriniz"
            }
            else
            {
                textLabel.text = ""
            }
        }
        
    }
    
    @objc func buttonActionDone(sender: UIButton!)
    {
        textLabel.text = ""
        blurrviewSecond.layer.opacity = 0
        backButton.layer.opacity = 0
        tuketim.layer.opacity = 0
        literFin.layer.opacity = 0
        toplamLitre.layer.opacity = 0
    }
    
}

