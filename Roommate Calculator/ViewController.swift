//
//  ViewController.swift
//  Ajay'sRentApp
//
//  Created by Ajay Kumar on 5/18/17.
//  Copyright © 2017 Ajay Kumar. All rights reserved.
//

import UIKit
import MessageUI


var someVariable:Float = 0


class ViewController: UIViewController, UITextFieldDelegate, MFMessageComposeViewControllerDelegate {

    var i:Int = 0
    var rentPerPerson:Float = 0

    
    //Add Buttons
    @IBOutlet var resetBtn: UIButton!
        
    @IBOutlet var calcBtn: UIButton!
    @IBOutlet var msgBtn: UIButton!
    
    @IBOutlet var settingBtn: UIButton!
    
    //Textfields
    @IBOutlet var Roomate1Output: UITextField!
    @IBOutlet var Roomate2Output: UITextField!
    @IBOutlet var Roomate3Output: UITextField!
    @IBOutlet var Roomate4Output: UITextField!
    @IBOutlet var utilAmount: UITextField! = nil
    
    @IBOutlet var totalRent: UITextField!
    
    //Labels
    @IBOutlet var deepLabel: UILabel!
    @IBOutlet var AjayLabel: UILabel!


    @IBAction func resetButton(_ sender: Any) {
        
        if(Roomate1Output.text != nil){
            
            Roomate1Output.text  = nil
            Roomate4Output.text  = nil
            Roomate2Output.text  = nil
            Roomate3Output.text  = nil
            utilAmount.text = "0"
            totalRent.text = nil
        }
        
       
    }
    
    @IBAction func CalcButton(_ sender: Any) {


//        if(utilAmount.text == nil){
//            let temp:Float = 0
//            utilAmount.text = (String(temp))
//        }
        if(utilAmount.text != nil){
            someVariable = 0
            someVariable = (Float(utilAmount.text!)!)

        }
        
        

        let utilCharg:Float = someVariable
        var Roomate1:Float = 0
        var Roomate2:Float = 0
        var Roomate3:Float = 0
        var Roomate4:Float = 0
        var totalRentAmount:Float = 0
        let internet:Float = 15
        let parkingCharges:Float = 50.0 / 3

        if((rentCostAmount != "") || ((numOfRoomates != ""))){
            rentPerPerson = (Float(rentCostAmount))! / (Float(numOfRoomates))!
//            let rentAmt = UserDefaults.standard.set(self.rentPerPerson, forKey: "rentAmount")
        }
        
        

        if(tog1Value){
             Roomate1 = Roomate1 + parkingCharges + rentPerPerson + (utilCharg / 4) + internet
        } else {
                Roomate1 = Roomate1 + rentPerPerson + (utilCharg / 4) + internet
        }
       
        if(tog2Value){
            Roomate3 = Roomate3 + parkingCharges + (utilCharg / 4) + rentPerPerson + internet

        }else{
            Roomate3 = Roomate3  + (utilCharg / 4) + rentPerPerson + internet

        }
        if(tog3Value){
            Roomate4 = Roomate4 + parkingCharges + rentPerPerson + (utilCharg / 4) + internet

        }else {
            Roomate4 = Roomate4 + rentPerPerson + (utilCharg / 4) + internet

        }
        if(tog4Value){
            Roomate2 = Roomate2 + parkingCharges + rentPerPerson + (utilCharg / 4) - (internet * 3)

        }else{
            Roomate2 = Roomate2 + rentPerPerson + (utilCharg / 4) - (internet * 3)

        }

        
        totalRentAmount = Roomate1 + Roomate2 + Roomate3 + Roomate4
        
        Roomate1Output.text  = String(format: "%.2f", Roomate1)
        Roomate4Output.text  = String(format: "%.2f", Roomate2)
        Roomate2Output.text  = String(format: "%.2f", Roomate3)
        Roomate3Output.text  = String(format: "%.2f", Roomate4)
        totalRent.text  = String(format: "%.2f", totalRentAmount)


    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.utilAmount.delegate = self
        self.utilAmount.keyboardType = UIKeyboardType.decimalPad
        //UserDefaults.standard.register(defaults: [String: Any]())

        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "sendDataSeg" {
//            let secondViewController: secondViewController = segue.destinationViewController as! SendingVC
//            secondViewController.delegate = self
//        }
//    }
//    
    
    
    override func viewDidAppear(_ animated: Bool) {
        //utilAmount.text = numOfRoomates;
        
        resetBtn.layer.cornerRadius = 5
        resetBtn.clipsToBounds = true
        
        calcBtn.layer.cornerRadius = 5
        calcBtn.clipsToBounds = true
        
        msgBtn.layer.cornerRadius = 5
        msgBtn.clipsToBounds = true
        
        settingBtn.layer.cornerRadius = 5
        settingBtn.clipsToBounds = true
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        

        let userDefaults = UserDefaults.standard
        let userName = userDefaults.string(forKey: "name_preference")
        print("user name = \(String(describing: userName))")
        
        userDefaults.setValue("John", forKey: "name_preference")
        
        UserDefaults.standard.set(tog1Value, forKey: "toggle1Amt")
        UserDefaults.standard.set(tog2Value, forKey: "toggle2Amt")
        UserDefaults.standard.set(tog3Value, forKey: "toggle3Amt")
        UserDefaults.standard.set(tog4Value, forKey: "toggle4Amt")


        
        UserDefaults.standard.bool(forKey: "toggle1Amt")
        UserDefaults.standard.bool(forKey: "toggle2Amt")
        UserDefaults.standard.bool(forKey: "toggle3Amt")
        UserDefaults.standard.bool(forKey: "toggle4Amt")
        UserDefaults.standard.float(forKey: "rentCostAmt")


//
//        UserDefaults.value(forKey: "tog1Value")
//        UserDefaults.value(forKey: "tog2Value")
//        UserDefaults.value(forKey: "tog3Value")
//        UserDefaults.value(forKey: "tog4Value")
//        
//        UserDefaults.setValue(tog1Value, forKey: "tog1Value")
//        UserDefaults.setValue(tog2Value, forKey: "tog2Value")
//        UserDefaults.setValue(tog3Value, forKey: "tog3Value")
//        UserDefaults.setValue(tog4Value, forKey: "tog4Value")


        
//        UserDefaults.string(tog1Value, forKey: "toggle1Value")
//        UserDefaults.setValue(tog2Value, forKey: "toggle2Value")
//        UserDefaults.setValue(tog3Value, forKey: "toggle3Value")
//        UserDefaults.setValue(tog4Value, forKey: "toggle4Value")
//        UserDefaults.setValue(rentPerPerson, forKey: "rentAmount")
        
        userDefaults.synchronize()




        
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let inverseSet = NSCharacterSet(charactersIn:"0123456789").inverted
        
        let components = string.components(separatedBy: inverseSet)
        
        let filtered = components.joined(separator: "")
        
        if filtered == string {
            return true
        } else {
            if string == "." {
                let countdots = textField.text!.components(separatedBy:".").count - 1
                if countdots == 0 {
                    return true
                }else{
                    if countdots > 0 && string == "." {
                        return false
                    } else {
                        return true
                    }
                }
            }else{
                return false
            }
        }
    }
    
    

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        utilAmount.resignFirstResponder()
        CalcButton(self)
        return(true)
    }
    
    //    func screenShotMethod() {
    //
    //        if (MFMessageComposeViewController.canSendText()) {
    //            // Obtain a configured MFMessageComposeViewController
    //            //Create the UIImage
    //            UIGraphicsBeginImageContext(view.frame.size)
    //
    //            view.layer.renderInContext(UIGraphicsGetCurrentContext())
    //            let image = UIGraphicsGetImageFromCurrentImageContext()
    //            UIGraphicsEndImageContext()
    //            //Save it to the camera roll
    //            //UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    //
    //            let messageComposeVC = messageComposer.configuredMessageComposeViewController()
    //            //messageComposeVC.body = image
    //            var imageData = UIImageJPEGRepresentation(image, 1.0)
    //            messageComposeVC.addAttachmentData(imageData, typeIdentifier: "image/jpeg", filename: "My Image")
    //            presentViewController(messageComposeVC, animated: true, completion: nil)
    //        }
    //        else
    //        {
    //            println("No good")
    //        }
    //    }
    

    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        
        controller.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func messageGroup(_ sender: Any) {
        if(MFMessageComposeViewController.canSendText()){
            UIGraphicsBeginImageContext(view.frame.size)
            
            view.layer.render(in: UIGraphicsGetCurrentContext()!)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            //UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
            
            //Edit String here to send UI screenshot to recipents 
            let recipients:[String] = ["2126743254"]
            let messageController = MFMessageComposeViewController()

            messageController.messageComposeDelegate  = self
            messageController.recipients = recipients
            let ImageData = UIImageJPEGRepresentation(image!, 1.0)
            messageController.addAttachmentData(ImageData!, typeIdentifier: "image/jpeg", filename: "My Image.jpeg")
            //presentedViewController(messageController)
            //presentedViewController(messageController, animated:true, completion: nil)
            messageController.body = "Hey guys! This is the rent for this month"
            self.present(messageController, animated: true, completion: nil)
        }
        else{
            print("Message not sent")
        }
        

    }
    
    

}

