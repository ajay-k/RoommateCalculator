import UIKit


protocol DataSentDelegate {
    func userDidEnterData(data: String)
}

var numOfRoomates = ""
var rentCostAmount = ""

class SecondViewController: UITableViewController {
    
    
    var someVariable:Int = 0

    
    
    @IBOutlet var rentCostTextField: UITextField!
    @IBOutlet var stepper: UIStepper!
    @IBOutlet var numOfMates: UITextField!
    
    
    var delegate: DataSentDelegate? = nil

    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultValues()
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
    }
    
    

    
    
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
