//
//  ViewController.swift
//  swiftdown
//
//  Created by Jakob Gürtl on 20.12.14.
//  Copyright (c) 2014 Jakob Gürtl. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate{
    
    var textView = UITextView()
    var webView = UIWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.frame = CGRect(x:0,y:10,width:view.frame.width,height:view.frame.height/2-10)
        textView.text = "__swiftdown__"
        textView.delegate = self
        
        webView.frame = CGRect(x:0,y:view.frame.height/2,width:view.frame.width,height:view.frame.height/2)
        
        view.addSubview(textView)
        view.addSubview(webView)
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        let html = renderHTML(textView.text)
        webView.loadHTMLString(html, baseURL: nil)
    }
    
    func renderHTML(markdown: String) -> String? {
        let cchar = strdup(markdown)
        let html = markdownify(cchar)
        return String.fromCString(html.memory.data)
    }



}

