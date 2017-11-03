//
//  ViewController.swift
//  2017F_MAD3115_FinalExam_Section_II
//
//  Created by moxDroid on 2017-11-02.
//  Copyright © 2017 moxDroid. All rights reserved.
//  Roll No.    :
//  Name        :

import UIKit
import MessageUI
import ContactsUI

class SMSAndPhoneCallViewController: UIViewController, MFMessageComposeViewControllerDelegate, CNContactPickerDelegate {

    
    @IBOutlet weak var txtCotactNumber: UITextField!
    @IBOutlet weak var txtMessage: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //Send SMS
    @IBAction func sendMessage(sender: UIButton) {
        
        if MFMessageComposeViewController.canSendText() {
            
            
            let messageVC = MFMessageComposeViewController()
            
            messageVC.body = txtMessage.text!
            messageVC.recipients = [txtCotactNumber.text!]
            messageVC.messageComposeDelegate = self
            
            self.present(messageVC, animated: false, completion: nil)
        }
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult)
    {
        
        switch (result) {
        case .cancelled:
            print("Message was cancelled")
            self.dismiss(animated: true, completion: nil)
        case .failed:
            print("Message failed")
            self.dismiss(animated: true, completion: nil)
        case .sent:
            print("Message was sent")
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    ///Make Phone Call
    @IBAction func makePhoneCall(sender: UIButton)
    {
        if let url = URL(string: "tel://\(txtCotactNumber.text!))"), UIApplication.shared.canOpenURL(url){
            if #available(iOS 10, *)
            {
                UIApplication.shared.open(url)
            }
            else
            {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    @IBAction func getContactClick(_ sender: UIButton) {
        let contactPicker = CNContactPickerViewController()
        contactPicker.delegate = self
        self.present(contactPicker, animated: true, completion: nil)
        
    }
    
    func contactPickerDidCancel(_ picker: CNContactPickerViewController){
        print("Cancelled..")
    }

    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
        
        if contact.phoneNumbers.count != 0 {
            txtCotactNumber.text  = String(describing: contact.phoneNumbers[0].value.stringValue)
        }else{
            txtCotactNumber.text = "No Number Found"
        }
        
        print("Name : \(contact.givenName)")
        if contact.emailAddresses.count != 0 {
            print("Email: \(String(describing: contact.emailAddresses[0].value))")
        }
    }
}

