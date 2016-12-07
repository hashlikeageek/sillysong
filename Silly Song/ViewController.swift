//
//  ViewController.swift
//  Silly Song
//
//  Created by Ashish Kumar Sai on 07/12/16.
//  Copyright © 2016 Ashish Rajendra Kumar Sai. All rights reserved.
//

import UIKit




class ViewController: UIViewController {

    
    @IBOutlet weak var namefield: UITextField!
    
    @IBOutlet weak var lyricsview: UITextView!
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        namefield.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func reset(_ sender: Any) {
        namefield.text=""
        lyricsview.text=""
     
    }
    @IBAction func displayLyrics(_ sender: Any) {
        let finalresult = lyricsFromName(bananaFanaTemplate,fullname: namefield.text!)
        lyricsview.text = finalresult
    }
  
    

}
  



func shortNameFromName (_ fullname: String)-> String{
    let lowercaseName = fullname.lowercased()
    let vowelSet = CharacterSet(charactersIn: "aieon")
    
    if let VowelRange = lowercaseName.folding(options: .diacriticInsensitive, locale: .current).rangeOfCharacter(from: vowelSet)
    {
        return lowercaseName.substring(from: VowelRange.lowerBound)
    }
        
    else
    {
        return lowercaseName
        
    }
}

func lyricsFromName (_ lyricstemplate: String, fullname : String) -> String
{
    let shortname = shortNameFromName(fullname)
    let lyrics = lyricstemplate
        .replacingOccurrences(of: "<FULL_NAME>", with: fullname)
        .replacingOccurrences(of: "<SHORT_NAME>", with: shortname )
    
    return lyrics
    
}

let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")




extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
}
}
