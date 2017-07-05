//
//  ViewController.swift
//  Bai1
//
//  Created by Cntt06 on 7/5/17.
//  Copyright © 2017 Cntt06. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var inactiveQueue: DispatchQueue!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //concurrentQueues1(); // Cach 1
        concurrentQueues2() // Cach 2
        if let queue = inactiveQueue {
            queue.activate()
        }
    }
    func concurrentQueues1() {
        let concurrentQueue = DispatchQueue(label: "thread", qos: .utility, attributes: .concurrent)
        concurrentQueue.async {
            for i in 0..<10 {
                print("🔴", i)
            }
        }
        concurrentQueue.async {
            for i in 100..<110 {
                print("🔵", i)
            }
        }
        concurrentQueue.async {
            for i in 1000..<1010 {
                print("⚫️", i)
            }
        }
    }
    func concurrentQueues2() {
        let concurrentQueue = DispatchQueue(label: "thread1", qos: .userInitiated, attributes: [.concurrent, .initiallyInactive])
        inactiveQueue = concurrentQueue
        concurrentQueue.async {
            for i in 0..<10 {
                print("🔴", i)
            }
        }
        concurrentQueue.async {
            for i in 100..<110 {
                print("🔵", i)
            }
        }
        concurrentQueue.async {
            for i in 1000..<1010 {
                print("⚫️", i)
            }
        }
    }
}

