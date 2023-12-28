//
//  ViewController.swift
//  LearnSwiftUI
//
//  Created by Monica Deshwal on 20/12/23.
//

import UIKit

class ViewController: UIViewController {
    
    /*
     Foundation defines multiple classes and structures to create and process dates, including Date, Calendar, DateComponents, DateInterval, Locale, and TimeZone. The data type in charge of creating the structure to store the actual date is Date.
     */
    /*
     These methods require a value of type Double to declare the interval in seconds, but instead of Double the framework calls it TimeInterval. This is typealias( an alternative name for an existing type), once defined alias are used exactly like regular data types.
     */
    /*
     The dates in Date structure are not associated to any calender. This means that to get the components in a date(year, month, day etc). We must decide first in the context of which calender the date is going to be interpreted. The calendar for a date is defined by the Calendar structure. This structure provides proerties and methods to process a date according to a specific calendar( Gregorian, Buddhist, Chinese etc)
     */
    /*
     The calendar structure works along with the Date compoents structure to read and return components from a date. The instance created from the DateComponents structure includes the properties era, year, yearforWeekOfYear, weekOfYear, weekOfMonth, weekday, weekdayOrdinal, day, hour, minute, second and nanosecond to read and set the values of the components. The following examples combines these tools to get the year of the current date.
     */
    /*
     To find a date falls inside between a time interval we use the date interval
     */
    /*
     Although we can create our own FormatStyle structure, the structure includes a type property called dateTime to return an instance with the calendar and standard values set by the device. If the configuration by default is enough, we can use this property to format the date.
     */
    /*
     Every device has a locale structure assigned by default, and our code will work with it unless we determine otherwise. To get a reference to the current structure or create a new one.
     */
    /*
     The date stored in a Date structure is not a date but the number of seconds between the date represented by the objrct and an arbitrary date in the past. To process these values and get the actual date, the calendar structure needs to know the user's time zone. Foundation includes the TimeZone structure to manage time zones. An object is assigned bydefault to the system containing the time zone where the device is located, but we can define a different one as we did with the locale structure(get the list with the
     availableIdentifier
     from the local structure). To get a reference to the current structure or create a new one, the TimeZone structure includes the following initializer and type property.
     */
    /*
     The list of names for the time zones is stored in a database. The timeZone structure offers the
     knownTimeZoneIdentifiers
     type property that you print to see all the values available
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //storing dates with date structures
        var currentDate = Date()
        var nextDay = Date(timeIntervalSinceNow: 24 * 60 * 60)
        var tenDaysBefore = Date(timeInterval: -10 * 24 * 3600, since: nextDay)
        
        //compare dates
        var days = 7
        var today = Date()
        var event = Date(timeIntervalSinceNow: Double(days) * 24 * 3600)
        
        if today.compare(event) == .orderedAscending {
            let interval = event.timeIntervalSince(today)
            print("We have to wait \(interval) seconds")
        }
        
        //extracting component from a date
        var todaysDate = Date()
        var calendar = Calendar.current
        var components = calendar.dateComponents([.year], from: todaysDate)
        print("This year is \(components.year!)")
        
        //extracting multiple components from a date
        var multipleComponents = calendar.dateComponents([.year, .month, .day], from: today)
        print("Today \(multipleComponents.day!)-\(components.month!)-\(components.year!)")
        
        //creating a new date from single components
         var comp = DateComponents()
        comp.year = 1970
        comp.month = 8
        comp.day = 21
        
        var bithday = calendar.date(from: comp)
        
        // using a gregorian calendar
        let id = Calendar.Identifier.gregorian
        let gregorianCalendar = Calendar(identifier: id)
        
        var compo = DateComponents()
        compo.year = 1970
        compo.month = 8
        compo.day = 21
        
        // Adding component to a date
        var compon = DateComponents()
        compon.day = 120
        var appointment = calendar.date(byAdding: compon, to: today)
        
        // Comparing dates (Number of hours or days remaining)
        var compone = DateComponents()
        compone.year = 1970
        compone.month = 8
        compone.day = 21
        var birthday = calendar.date(from: compone)
        
        if let oldDate = birthday {
            
            let compoents = calendar.dateComponents([.day], from: oldDate, to: today)
            print("Days between dates: \(compoents.day!)")
        }
        useTheDateInterval()
    }

    func useTheDateInterval() {
        
        let calendar = Calendar.current
        var comp = DateComponents()
        comp.year = 1970
        comp.month = 8
        comp.day = 21
        var today = Date()
        var birthday = calendar.date(from: comp)
        
        comp.year = 2020
        comp.month = 8
        comp.day = 21
        var future = calendar.date(from: comp)
        
        if birthday != nil && future != nil {
            
            let today = Date()
            let interval = DateInterval(start: birthday!, end: future!)
            if interval.contains(today) {
                
                print("You still have time")
            }
        }
    }

    func formatTheDate() {
        
        let myDate = Date.now
        let text = myDate.formatted(date: .abbreviated, time: .omitted)
        printContent(text)
        
        //Specifying a custom format
        let weekdayText = myDate.formatted(.dateTime.weekday(.wide))
        print(weekdayText)
        
        //including a multiple date components
        let multipleText = myDate.formatted(.dateTime.day().hour().month(.wide))
        print(multipleText)
    }
    
    func definingTheLocaleDate() {
        
        let myDate = Date.now
        let chinaLocale = Locale(identifier: "zh_CN")
        let text = myDate.formatted(.dateTime.locale(chinaLocale).day().month().year())
        print(text)
    }
    
    func workingWithDifferentTimeZone() {
        if let tokyoTimeZone = TimeZone(identifier: "Asia/Tokyo")
            , let madridTimeZone = TimeZone(identifier: "Europe/Madrid") {
            
            let date = Date.now
            let myTime = date.formatted(.dateTime.hour().minute().second())
            
            var dateTimeStyle = Date.FormatStyle()
            dateTimeStyle.timeZone = tokyoTimeZone
            let tokyoTime = date.formatted(dateTimeStyle.hour().minute().second())
            
            dateTimeStyle.timeZone = madridTimeZone
            let madridTime = date.formatted(dateTimeStyle.hour().minute().second())
            
            print("My time is \(myTime)")
            print("Tokyo time is \(tokyoTime)")
            print("Madrid Time is \(madridTime)")
        }
    }
}

