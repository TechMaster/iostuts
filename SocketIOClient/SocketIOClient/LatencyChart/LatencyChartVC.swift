//
//  LatencyChartVC.swift
//  SocketIOClient
//
//  Created by Techmaster on 5/5/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit
import Charts
import SocketIO

class LatencyChartVC: UIViewController {
    var chartView: LineChartView!

    var i: Double = 0
    
    let manager = SocketManager(socketURL: URL(string: "http://192.168.1.105:8000")!,config: [.log(false), .compress, .forceWebsockets(true), .forceNew(true)])
    
    var socket:SocketIOClient!
    var start: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        let h: CGFloat = 80.0
        chartView = LineChartView(frame: CGRect(x: 0, y: h, width: view.bounds.size.width, height: view.bounds.size.height - h))
        view.addSubview(chartView)
        
        chartView.delegate = self
        let set_a: LineChartDataSet = LineChartDataSet(entries: [ChartDataEntry](), label: "Socket Latency")
        set_a.drawCirclesEnabled = false
        set_a.setColor(UIColor.blue)
        set_a.mode = .cubicBezier
        chartView.data =  LineChartData(dataSet: set_a) //LineChartData(xVals: [String](), dataSets: [set_a])
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        socket = manager.defaultSocket;
        setSocketEvents();
        socket.connect();
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        socket.disconnect()
    }
    
    private func setSocketEvents()
    {
        socket.on(clientEvent: .connect) {data, ack in
            print("socket connected");
            self.start = CFAbsoluteTimeGetCurrent()
            self.socket.emit("ping_from_client", with: ["Ping from Client"])
        };
        
        socket.on("pong_from_server") {data, ack in
            let latency = CFAbsoluteTimeGetCurrent() - self.start
            self.updateChart(latency: latency)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.start = CFAbsoluteTimeGetCurrent()
                self.socket.emit("ping_from_client", with: ["Ping from Client"])
            }
            
        };
    };
    
    func updateChart(latency: Double) {
        chartView.data?.addEntry(ChartDataEntry(x: i, y: latency), dataSetIndex: 0)
        
        chartView.notifyDataSetChanged()
        chartView.setVisibleXRange(minXRange: 0, maxXRange: 10.0)
        chartView.moveViewToX(i)
        i = i + 1.0
    }
    
    
}

extension LatencyChartVC : ChartViewDelegate {
    
}
