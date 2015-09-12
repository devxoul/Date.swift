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

    public convenience init(year: Int, month: Int, day: Int, hours: Int, minutes: Int, seconds: Double) {
        let components = NSDateComponents()
        components.year = year
        components.month = month
        components.day = day
        components.hour = hours
        components.minute = minutes
        components.second = Int(seconds)
        components.nanosecond = Int((seconds - floor(seconds)) * 1_000_000_000)
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

    public convenience init(hours: Int, minutes: Int, seconds: Double) {
        let components = NSDateComponents()
        components.hour = hours
        components.minute = minutes
        components.second = Int(seconds)
        components.nanosecond = Int((seconds - floor(seconds)) * 1_000_000_000)
        let interval = NSCalendar.currentCalendar().dateFromComponents(components)?.timeIntervalSinceReferenceDate ?? 0
        self.init(timeIntervalSinceReferenceDate: interval)
    }

    public class func date(year: Int, _ month: Int, _ day: Int) -> NSDate {
        return NSDate(year: year, month: month, day: day)
    }

    public class func time(hours: Int, _ minutes: Int, _ seconds: Double) -> NSDate {
        return NSDate(hours: hours, minutes: minutes, seconds: seconds)
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
    public var hours: Int { return self.components(.Hour).hour }
    public var minutes: Int { return self.components(.Minute).minute }
    public var seconds: Double {
        let components = self.components([.Second, .Nanosecond])
        return Double(components.second) + Double(components.nanosecond) / 1_000_000_000
    }

    public func year(year: Int) -> NSDate {
        return NSDate(year: year, month: month, day: day, hours: hours, minutes: minutes, seconds: seconds)
    }

    public func month(month: Int) -> NSDate {
        return NSDate(year: year, month: month, day: day, hours: hours, minutes: minutes, seconds: seconds)
    }

    public func day(day: Int) -> NSDate {
        return NSDate(year: year, month: month, day: day, hours: hours, minutes: minutes, seconds: seconds)
    }

    public func hours(hours: Int) -> NSDate {
        return NSDate(year: year, month: month, day: day, hours: hours, minutes: minutes, seconds: seconds)
    }

    public func minutes(minutes: Int) -> NSDate {
        return NSDate(year: year, month: month, day: day, hours: hours, minutes: minutes, seconds: seconds)
    }

    public func seconds(seconds: Double) -> NSDate {
        return NSDate(year: year, month: month, day: day, hours: hours, minutes: minutes, seconds: seconds)
    }

    private func components(units: NSCalendarUnit) -> NSDateComponents {
        return NSCalendar.currentCalendar().components(units, fromDate: self)
    }

}


// MARK: - Relative datetime

public extension IntegerLiteralType {

    public var years: _DateTimeDelta { return _DateTimeDelta(self, .Year) }
    public var months: _DateTimeDelta { return _DateTimeDelta(self, .Month) }
    public var days: _DateTimeDelta { return _DateTimeDelta(self, .Day) }

    public var hours: _DateTimeDelta { return _DateTimeDelta(self, .Hour) }
    public var minutes: _DateTimeDelta { return _DateTimeDelta(self, .Minute)  }
    public var seconds: _DateTimeDelta { return _DateTimeDelta(self, .Second) }

    public var year: _DateTimeDelta { return self.years }
    public var month: _DateTimeDelta { return self.months }
    public var day: _DateTimeDelta { return self.days }

    public var hour: _DateTimeDelta { return self.hours }
    public var minute: _DateTimeDelta { return self.minutes }
    public var second: _DateTimeDelta { return self.seconds }

}

public extension FloatLiteralType {

    public var seconds: _DateTimeDelta { return _DateTimeDelta(self, .Second) }
    public var second: _DateTimeDelta { return self.seconds }

}

public struct _DateTimeDelta {

    public var value: NSTimeInterval
    public var unit: NSCalendarUnit

    public init(_ value: NSTimeInterval, _ unit: NSCalendarUnit) {
        self.value = value
        self.unit = unit
    }

    public init(_ value: IntegerLiteralType, _ unit: NSCalendarUnit) {
        self.init(NSTimeInterval(value), unit)
    }

    private var negativeDelta: _DateTimeDelta {
        return self.dynamicType.init(-self.value, self.unit)
    }


    public func after(date: NSDate) -> NSDate {
        switch self.unit {
        case NSCalendarUnit.Year: return date.year(date.year + Int(self.value))
        case NSCalendarUnit.Month: return date.month(date.month + Int(self.value))
        case NSCalendarUnit.Day: return date.day(date.day + Int(self.value))
        case NSCalendarUnit.Hour: return date.hours(date.hours + Int(self.value))
        case NSCalendarUnit.Minute: return date.minutes(date.minutes + Int(self.value))
        case NSCalendarUnit.Second: return date.seconds(date.seconds + self.value)
        default: return date
        }
    }

    public func before(date: NSDate) -> NSDate {
        return self.negativeDelta.after(date)
    }

    public var fromNow: NSDate {
        return self.after(NSDate())
    }

    public var ago: NSDate {
        return self.negativeDelta.fromNow
    }

}

public func + (date: NSDate, delta: _DateTimeDelta) -> NSDate { return delta.after(date) }
public func + (delta: _DateTimeDelta, date: NSDate) -> NSDate { return delta.after(date) }
public func - (date: NSDate, delta: _DateTimeDelta) -> NSDate { return delta.before(date) }
