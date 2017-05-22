import UIKit


protocol DataSentDelegate {
    func userDidEnterData(data: String)
}

var numOfRoomates = ""
var rentCostAmount = ""
var tog1Value:Bool = true
var tog2Value:Bool = true
var tog3Value:Bool = true
var tog4Value:Bool = true


class SecondViewController: UITableViewController {
    
    
    var someVariable:Int = 0
    var delegate: DataSentDelegate? = nil

    //Steppers
    @IBOutlet var stepper: UIStepper!

    
    //Textfields
    @IBOutlet var rentCostTextField: UITextField!
    @IBOutlet var numOfMates: UITextField!
    
    
    //Toggles

    @IBOutlet var togMate1: UISwitch!
    @IBOutlet var togMate2: UISwitch!
    @IBOutlet var togMate3: UISwitch!
    @IBOutlet var togMate4: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultValues()
        print(togMate1.isOn)
       //         Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func defaultValues() {
       
        
        if((numOfMates.text?.isEmpty)!){
            numOfMates.text = "0"
            
        } else {
            someVariable = (Int(numOfMates.text!)!)
        }
        
        if((rentCostTextField.text?.isEmpty)!){
            rentCostTextField.text = "0"
            
        } else {
            someVariable = (Int(rentCostTextField.text!)!)
        }
        
        

    }
    
    @IBAction func numMateStepper(_ sender: UIStepper) {
        
        numOfMates.text = String(Int(sender.value))
    }
    
    @IBAction func tog1Action(_ sender: UISwitch) {
        
        UserDefaults.standard.set(sender.isOn, forKey: "switch1State")
        if(!(sender.isOn)){
            tog1Value = false
            //print(tog1Value)
        }else {
            tog1Value = true
            //print(tog1Value)
        }
    }

    @IBAction func tog2Action(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "switch2State")
        if(!(sender.isOn)){
            tog2Value = false
            //print(tog1Value)
        }else {
            tog2Value = true
            //print(tog1Value)
        }

    }
    
    @IBAction func tog3Action(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "switch3State")
        if(!(sender.isOn)){
            tog3Value = false
            //print(tog1Value)
        }else {
            tog3Value = true
            //print(tog1Value)
        }
    }
    
    @IBAction func tog4Action(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "switch4State")
        if(!(sender.isOn)){
            tog4Value = false
            //print(tog1Value)
        }else {
            tog4Value = true
            //print(tog1Value)
        }

    }
    
    @IBAction func saveBtnWasPressed(_ sender: Any) {
    
        if(numOfMates.text != nil){
            numOfRoomates = numOfMates.text!
            UserDefaults.standard.set(numOfMates.text, forKey: "numberOfMates")
            performSegue(withIdentifier: "segue", sender: self)
        }else{
            numOfRoomates = String(1)
        }
        
        
        
        if(rentCostTextField.text != nil){
            rentCostAmount = rentCostTextField.text!
            UserDefaults.standard.set(rentCostTextField.text, forKey: "rentCostText")
            performSegue(withIdentifier: "segue", sender: self)
        }
        
       
    }

    override func viewDidAppear(_ animated: Bool) {
        
        ///stepper.value = Double(numOfMates.text!)!
        
        if let x = UserDefaults.standard.object(forKey: "numberOfMates") as? String
        {
            numOfMates.text = x
            stepper.value = Double(x)!
            numOfRoomates = x

        }
        
        if let y = UserDefaults.standard.object(forKey: "rentCostText") as? String
        {
            rentCostTextField.text = y
            rentCostAmount = y
        }
        
        togMate1.isOn =  UserDefaults.standard.bool(forKey: "switch1State")
        togMate2.isOn =  UserDefaults.standard.bool(forKey: "switch2State")
        togMate3.isOn =  UserDefaults.standard.bool(forKey: "switch3State")
        togMate4.isOn =  UserDefaults.standard.bool(forKey: "switch4State")

        
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
    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        utilAmount.resignFirstResponder()
//        CalcButton(self)
//        return(true)
//    }
//
    
    

    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        var ViewController = segue.destination as! ViewController
//        
//        var someVariable:Float
//
//        if((rentCostTextField.text?.isEmpty)!){
//            let someVariable = 0.0
//            rentCostTextField.text = String(0)
//            ViewController.rentPerPerson = someVariable
//
//            
//        } else {
//            //utilAmount.text = String(5)
//            someVariable = (Float(rentCostTextField.text!)!)
//            ViewController.rentPerPerson = someVariable
//        }
//        
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
