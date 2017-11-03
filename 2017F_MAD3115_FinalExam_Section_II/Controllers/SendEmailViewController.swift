//
//  SendEmailViewController.swift
//  2017F_MAD3115_FinalExam_Section_II
//
//  Created by moxDroid on 2017-11-02.
//  Copyright © 2017 moxDroid. All rights reserved.
//  Roll No.    :
//  Name        :

import UIKit
import MessageUI
import ContactsUI

class SendEmailViewController: UIViewController, MFMailComposeViewControllerDelegate, CNContactPickerDelegate, UITextFieldDelegate {
@IBOutlet weak var textEmail: UITextField!
    @IBOutlet var subject: UITextField!
    @IBOutlet var body: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        textEmail.delegate = self

    }
    
    @IBAction func sendMail(sender: AnyObject) {
        if MFMailComposeViewController.canSendMail() {
            
            let picker = MFMailComposeViewController()
            picker.mailComposeDelegate = self
            picker.setToRecipients([textEmail.text!])
            picker.setSubject(subject.text!)
            picker.setMessageBody(body.text!, isHTML: true)
            
            present(picker, animated: true, completion: nil)
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let contactPicker = CNContactPickerViewController()
        contactPicker.delegate = self
        self.present(contactPicker, animated: true, completion: nil)
        
    }
    
    // MFMailComposeViewControllerDelegate
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        dismiss(animated: true, completion: nil)
    }
    
    func contactPickerDidCancel(_ picker: CNContactPickerViewController){
        print("Cancelled..")
    }
    
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
    
        if contact.emailAddresses.count != 0 {
            print("Email: \(String(describing: contact.emailAddresses[0].value))")
            textEmail.text = String(describing: contact.emailAddresses[0].value)
        }else{
            textEmail.text = "No Email Found"
        }
    }

}
