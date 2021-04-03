//
//  LatencyChartVC.swift
//  SocketIOClient
//
//  Created by Techmaster on 5/5/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit
import Charts

class RealTimeUpdateChartVC: UIViewController {
    var chartView: LineChartView!
    var timer: Timer!
    var i: Double = 0
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
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateChart), userInfo: nil, repeats: true)
    }
    
    @objc func updateChart() {
        chartView.data?.addEntry(ChartDataEntry(x: i, y: Double.random(in: 0.0...20.0)), dataSetIndex: 0)
      
        chartView.notifyDataSetChanged()
        chartView.setVisibleXRange(minXRange: 0, maxXRange: 10.0)
        chartView.moveViewToX(i)
       
        
  
        i = i + 1.0
    }


}

extension RealTimeUpdateChartVC : ChartViewDelegate {
    
}
