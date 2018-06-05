//
//  LineChartView.swift
//  CryptoCurrencyTest
//
//  Created by Manuel Martinez Gomez on 5/6/18.
//  Copyright © 2018 Mandaleo. All rights reserved.
//

import UIKit
import Charts

class LineChart: UIView {

    //Line graph properties
    let lineChartView = LineChartView()
    var lineDataEntry: [ChartDataEntry] = []
    
    //Chart data
    var datePrice = [String]()
    var amountPrice = [String]()
    
    var delegate: GetChartData! {
        didSet {
            populateData()
            lineChartSetup()
        }
    }
    
    func populateData() {
        datePrice = delegate.datePrice
        amountPrice = delegate.amountPrice
    }
    
    func lineChartSetup() {
        
        //Line chart config
        self.backgroundColor = UIColor.white
        self.addSubview(lineChartView)
        lineChartView.translatesAutoresizingMaskIntoConstraints = false
        lineChartView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        lineChartView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        lineChartView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        lineChartView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        //Line chart animation
        lineChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .easeInSine)
        
        //line chart population
        setLineChart(dataPoints: datePrice, values: amountPrice)
    }
    
    func setLineChart(dataPoints: [String], values: [String]) {
        
        // No data setup
        lineChartView.noDataTextColor = UIColor.white
        lineChartView.noDataText = "No data for the chart"
        lineChartView.backgroundColor = UIColor.white
        
        // Data point setup & color config
        for i in 0..<dataPoints.count {
            if let yDouble = Double(values[i]){
                let dataPoint = ChartDataEntry(x: Double(i), y: yDouble)
                lineDataEntry.append(dataPoint)
            }
        }
        
        let chartDataSet = LineChartDataSet(values: lineDataEntry, label: "Date")
        let chartData = LineChartData()
        chartData.addDataSet(chartDataSet)
        chartData.setDrawValues(true) // false if don´t wan values above bar
        chartDataSet.colors = [UIColor.blue]
        chartDataSet.setCircleColor(UIColor.blue)
        chartDataSet.circleHoleColor = UIColor.blue
        chartDataSet.circleRadius = 4.0
        
        //Gradient fill
        let gradientColors = [UIColor.blue.cgColor, UIColor.clear.cgColor] as CFArray
        let colorLocations: [CGFloat] = [1.0, 0.0]
        guard let gradient = CGGradient.init(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: gradientColors, locations: colorLocations) else {
            print("gradient error")
            return
        }
        chartDataSet.fill = Fill.fillWithLinearGradient(gradient, angle: 90.0)
        chartDataSet.drawFilledEnabled = true
        
        // Axes setup
        let formatter = ChartFormatter()
        formatter.setValues(values: dataPoints)
        let xaxis: XAxis = XAxis()
        xaxis.valueFormatter = formatter
        lineChartView.xAxis.labelPosition = .bottom
        lineChartView.xAxis.drawGridLinesEnabled = false // true if want X-Axis grid lines
        lineChartView.xAxis.valueFormatter = xaxis.valueFormatter
        lineChartView.chartDescription?.enabled = false
        lineChartView.legend.enabled = true
        lineChartView.rightAxis.enabled = false
        lineChartView.leftAxis.drawGridLinesEnabled = false
        lineChartView.leftAxis.drawLabelsEnabled = true
        
        lineChartView.data = chartData
    }
    
}
