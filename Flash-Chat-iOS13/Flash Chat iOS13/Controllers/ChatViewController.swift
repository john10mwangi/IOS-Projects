//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    let db = Firestore.firestore()
    
    var messages = [
        Message(sender: "trizah@gmail.com", body: "Hello"),
        Message(sender: "peter@gmail.com", body: "Hello too"),
        Message(sender: "cephas@gmail.com", body: "Hi"),
        Message(sender: "tonia@gmail.com", body: "Hi too")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        navigationItem.hidesBackButton = true
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        loadMessages()

    }
    
    func loadMessages() {
        db.collection(K.FStore.collectionName).order(by: K.FStore.dateField).addSnapshotListener { (querySnapshot, error) in
            if let safeErr = error{
                print("There was an error retrieving data \(safeErr.localizedDescription)")
            }
            
            if let safeSnapShot = querySnapshot {
                self.messages = []
                for doc in safeSnapShot.documents {
                    let data = doc.data()
                    if let senderText = data[K.FStore.senderField] as? String, let bodyText = data[K.FStore.bodyField]  as? String{
                        self.messages.append(Message(sender: senderText, body: bodyText))
                        
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                            let indexPath = IndexPath(item: self.messages.count - 1, section: 0)
                            self.tableView.scrollToRow(at: indexPath, at: UITableView.ScrollPosition.top, animated: false)
                        }
                    }
                }
            }
        }
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        if let messageBody = messageTextfield.text, let senderStr = Auth.auth().currentUser?.email {
            db.collection(K.FStore.collectionName).addDocument(
                data: [
                    K.FStore.bodyField: messageBody,
                    K.FStore.senderField: senderStr,
                    K.FStore.dateField: Date().timeIntervalSince1970
                ]){ error in
                    if let safeError = error {
                        print("There was an issue saving data to firestore \(safeError.localizedDescription)")
                    }else{
                        self.messageTextfield.text = nil
                        print("successfully stored")
                    }
                }
        }
    }
    

    @IBAction func logoutPressed(_ sender: UIBarButtonItem) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
    }
}

extension ChatViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let msg = messages[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell
        cell.messageTextLabel.text = msg.body
        
        if msg.sender == Auth.auth().currentUser?.email {
            cell.leftIconView.isHidden = true
            cell.righticonView.isHidden = false
            cell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.lightPurple)
            cell.messageTextLabel.textColor = UIColor(named: K.BrandColors.purple)
        }else{
            cell.leftIconView.isHidden = false
            cell.righticonView.isHidden = true
            cell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.lighBlue)
            cell.messageTextLabel.textColor = UIColor(named: K.BrandColors.blue)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
}
