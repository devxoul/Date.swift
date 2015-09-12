// The MIT License (MIT)
//
// Copyright (c) 2015 Suyeol Jeon (xoul.kr)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import Foundation


// MARK: - Initializing with date components

public extension NSDate {

    public convenience init(year: Int, month: Int, day: Int, hour: Int, minute: Int, second: Double) {
        let components = NSDateComponents()
        components.year = year
        components.month = month
        components.day = day
        components.hour = hour
        components.minute = minute
        components.second = Int(second)
        components.nanosecond = Int((second - floor(second)) * 1_000_000_000)
        let interval = NSCalendar.currentCalendar().dateFromComponents(components)?.timeIntervalSinceReferenceDate ?? 0
        self.init(timeIntervalSinceReferenceDate: interval)
    }

    public convenience init(year: Int, month: Int, day: Int) {
        let components = NSDateComponents()
        components.year = year
        components.month = month
        components.day = day
        let interval = NSCalendar.currentCalendar().dateFromComponents(components)?.timeIntervalSinceReferenceDate ?? 0
        self.init(timeIntervalSinceReferenceDate: interval)
    }

    public convenience init(hour: Int, minute: Int, second: Double) {
        let components = NSDateComponents()
        components.hour = hour
        components.minute = minute
        components.second = Int(second)
        components.nanosecond = Int((second - floor(second)) * 1_000_000_000)
        let interval = NSCalendar.currentCalendar().dateFromComponents(components)?.timeIntervalSinceReferenceDate ?? 0
        self.init(timeIntervalSinceReferenceDate: interval)
    }

}


// MARK: - Extracting date

public extension NSDate {

    public var date: NSDate {
        return NSDate(year: self.year, month: self.month, day: self.day)
    }

    public class var today: NSDate {
        return NSDate().date
    }

}


// MARK: - Setter and getters for date components

public extension NSDate {

    public var year: Int { return self.components(.Year).year }
    public var month: Int { return self.components(.Month).month }
    public var day: Int { return self.components(.Day).day }
    public var hour: Int { return self.components(.Hour).hour }
    public var minute: Int { return self.components(.Minute).minute }
    public var second: Double {
        let components = self.components([.Second, .Nanosecond])
        return Double(components.second) + Double(components.nanosecond) / 1_000_000_000
    }

    public func year(year: Int) -> NSDate {
        return NSDate(year: year, month: month, day: day, hour: hour, minute: minute, second: second)
    }

    public func month(month: Int) -> NSDate {
        return NSDate(year: year, month: month, day: day, hour: hour, minute: minute, second: second)
    }

    public func day(day: Int) -> NSDate {
        return NSDate(year: year, month: month, day: day, hour: hour, minute: minute, second: second)
    }

    public func hour(hour: Int) -> NSDate {
        return NSDate(year: year, month: month, day: day, hour: hour, minute: minute, second: second)
    }

    public func minute(minute: Int) -> NSDate {
        return NSDate(year: year, month: month, day: day, hour: hour, minute: minute, second: second)
    }

    public func second(second: Double) -> NSDate {
        return NSDate(year: year, month: month, day: day, hour: hour, minute: minute, second: second)
    }

    private func components(units: NSCalendarUnit) -> NSDateComponents {
        return NSCalendar.currentCalendar().components(units, fromDate: self)
    }

}
