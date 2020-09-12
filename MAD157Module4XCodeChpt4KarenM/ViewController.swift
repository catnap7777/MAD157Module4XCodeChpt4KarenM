//
//  ViewController.swift
//  MAD157Module4XCodeChpt4KarenM
//
//  Created by Karen Mathes on 9/11/20.
//  Copyright © 2020 TygerMatrix Software. All rights reserved.
//

import UIKit
//.. Sections between the "/**" and "*/" generate quickhelp in inspector area when the following function or whatever is "clicked" ... see below kamBogusFunction function for examples

//.. per LinkedIn Video, UITextFieldDelegate and following code allows for a different way to dismiss the keyboard (when the RETURN key on phone keyboard is pressed)... see textFieldShouldReturn function below
//.. Also note, you can customize the RETURN key on the phone keyboard by setting the property for the textfield (textDisplay) by showing the inspector area on the storyboard -- look under "text input traits", find the "return key" drop down, and select something (note: this doesn't define functionality...it just defines the "style" of the button). They selected "Done" in the class; So I did the same and now instead of the phone keyboard button saying "RETURN", it now says "Done"
class ViewController: UIViewController, UITextFieldDelegate {

    // MARK: Properties
    @IBOutlet var textDisplay: UITextField!
    @IBOutlet var labelResult: UILabel!
    @IBOutlet var changeButtonObj: UIButton!
    @IBOutlet var clearButtonObj: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //.. have the focus and keyboard up on the text field... per the LinkedInVideo iOS 12 Developement Essentials Training... need to move button up on screen though so this works right... see branch firstResponder1... on here because of where button is located (lower right corner), you have to use command-K to show hide keyboard
        //.. In addition, using the storyboard and attributes inspector, for the textfield (textDisplay), set "clear button" to "is always visible" and specify "clear when editting begins" to have little "x" to clear the text in the box present and to have "hint" disappear when editting begins
        textDisplay.becomeFirstResponder()
        
        //..$$$$
        //..associate the text field with it's delegate object... see %%% below
        textDisplay.delegate = self
        
        
    }

    //***********************************************************************
    //.. Just extra stuff that I was playing around with...
    //.. EXAMPLE OF HOW TO GET QUICKHELP TO WORK; TO SEE IT, CLICK ON "kamBogusFunction" below. NOTE: All this must be right before the funtion with no other code or comments in between...
    
    /** $%^ This is an example how quickhelp works. See https://developer.apple.com/library/archive/documentation/Xcode/Reference/xcode_markup_formatting_ref/SymbolDocumentation.html for more help $%^
     
     - important: This is a way
     to get the readers attention
     for something.
     
     - returns: Nothing
     
     - version: 1.0
     
     - Author: Newbie
     
     - sender: who cares?
     */
    /// - Parameter llamaCount: The number of llamas in the managed herd.
    /// - Returns: A random number between `min` and `max`
    /// - Throws: An error of type `FakeArrayError`
    func kamBogusFunction(llamaCount: Int) {
        print("function that does nothing just to demonstrate how quickhelp works")
    }
    
    
    // MARK: Methods
    @IBAction func changeButton(_ sender: Any) {
        
        labelResult.text = textDisplay.text?.uppercased()
        print (labelResult.text!)
        
        //.. get rid of keyboard after user has pressed button... per the LinkedInVideo iOS 12 Developement Essentials Training... need to move button up on screen though so this works right... see branch firstResponder1... on here because of where button is located (lower right corner), you have to use command-K to show hide keyboard
        textDisplay.resignFirstResponder()
    }
    
    @IBAction func clearButton(_ sender: Any) {
        labelResult.text = ""
        textDisplay.text = ""
        textDisplay.becomeFirstResponder()
    }
    
    //.. Use this function (part of UIViewController Class), to have keyboard disappear if user touches ANYWHERE on the screen --- so in this case, since button is on bottom right, user can touch screen anywhere, which hides the keyboard, and then they can hit the button
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textDisplay.resignFirstResponder()
    }
    
    //.. controls what should happen when the RETURN key on the phone keyboard is pressed.  In this case, it's asking if it should go to a new line when the return key is pressed.  False means no, it should NOT behave as normal and it should not go to a new line
    //%%%%.. also, this function is not enough; you need to associate the text field with it's delegate object (see $$$$ above)
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        //.. false means do NOT do a line break for the return key being pressed
        return false
    }
    
}

