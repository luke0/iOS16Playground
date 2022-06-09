//
//  CalendarViewController.swift
//  CombinedOne
//
//  Created by Luke Inger on 09/06/2022.
//

import UIKit

class CalendarViewController: UIViewController {
    
    struct customDate {
        let date: Date?
        let type: Int
        
        init(dateString: String, type: Int){
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy'/'MM'/'dd'"
            
            self.date = dateFormatter.date(from: dateString)
            self.type = type
        }
    }
    
    var dates = [customDate]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createCalendarView()
        
        dates.append(customDate(dateString: "2022/06/09", type: 0))
        dates.append(customDate(dateString: "2022/06/10", type: 1))
    
    }
    
    func createCalendarView(){
        
        let calendarView = UICalendarView()
        calendarView.delegate = self;
        calendarView.calendar = .current
        calendarView.locale = .current
        calendarView.fontDesign = .default
        calendarView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(calendarView)
        
        NSLayoutConstraint.activate([
            calendarView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            calendarView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            calendarView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
    
}

extension CalendarViewController : UICalendarViewDelegate, UICalendarSelectionSingleDateDelegate {
    
    func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
        
        for date in dates {
            if dateComponents.date == date.date {
                if date.type == 0 {
                    return .image(UIImage(systemName: "house"))
                } else {
                    return .image(UIImage(systemName: "entry.lever.keypad"))
                }
            }
        }
        
        /*
         switch myDatabase.eventType(on: dateComponents) {
             case .none:
                 return nil
             case .busy:
                 return .default()
             case .travel:
                 return .image(airplaneImage, color: .systemOrange)
             case .party:
                 return .customView {
                     MyPartyEmojiLabel()
                 }
             }
         */
        
        return .default()
    }
    
    func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
        
    }
}
