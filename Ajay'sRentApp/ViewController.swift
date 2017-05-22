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

    //Add Buttons
    var i:Int = 0

    
    
    //Textfields
    @IBOutlet var AjayOutput: UITextField!
    @IBOutlet var KaranOutput: UITextField!
    @IBOutlet var AmanOutput: UITextField!
    @IBOutlet var DeepOutput: UITextField!
    @IBOutlet var utilAmount: UITextField! = nil
    
    
    //Labels
    @IBOutlet var deepLabel: UILabel!
    @IBOutlet var AjayLabel: UILabel!


    @IBAction func resetButton(_ sender: Any) {
        
        if(AjayOutput.text != nil){
            
            AjayOutput.text  = nil
            DeepOutput.text  = nil
            KaranOutput.text  = nil
            AmanOutput.text  = nil
            //utilAmount.text = nil
        }
        
        i = i + 1
        if(i == 3){
            deepLabel.text = "Faggot"
            i = 0
        } else {
            deepLabel.text = "Deep"
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
        var Ajay:Float = 0
        var Deep:Float = 0
        var Karan:Float = 0
        var Aman:Float = 0
        let internet:Float = 15
        let parkingCharges:Float = 50.0 / 3
        var rentPerPerson:Float = 0

        if((rentCostAmount != "") || ((numOfRoomates != ""))){
            rentPerPerson = (Float(rentCostAmount))! / (Float(numOfRoomates))!
        }
        
        

        if(tog1Value){
             Ajay = Ajay + parkingCharges + rentPerPerson + (utilCharg / 4) + internet
        } else {
                Ajay = Ajay + rentPerPerson + (utilCharg / 4) + internet
        }
       
        if(tog2Value){
            Karan = Karan + parkingCharges + (utilCharg / 4) + rentPerPerson + internet

        }else{
            Karan = Karan  + (utilCharg / 4) + rentPerPerson + internet

        }
        if(tog3Value){
            Aman = Aman + parkingCharges + rentPerPerson + (utilCharg / 4) + internet

        }else {
            Aman = Aman + rentPerPerson + (utilCharg / 4) + internet

        }
        if(tog4Value){
            Deep = Deep + parkingCharges + rentPerPerson + (utilCharg / 4) - (internet * 3)

        }else{
            Deep = Deep + rentPerPerson + (utilCharg / 4) - (internet * 3)

        }

        
        
        AjayOutput.text  = String(format: "%.2f", Ajay)
        DeepOutput.text  = String(format: "%.2f", Deep)
        KaranOutput.text  = String(format: "%.2f", Karan)
        AmanOutput.text  = String(format: "%.2f", Aman)

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
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        

        let userDefaults = UserDefaults.standard
        let userName = userDefaults.string(forKey: "name_preference")
        print("user name = \(String(describing: userName))")
        
        userDefaults.setValue("John", forKey: "name_preference")
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
            
            let recipients:[String] = ["9254789631"]
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

