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

import XCTest
@testable import Date

class DateTests: XCTestCase {

    /// 1995-01-14T13:07:24.920110
    let birthdate = NSDate(timeIntervalSinceReferenceDate: -188250755.07989)


    // MARK:
    
    func test_initWithDatetime() {
        let date = NSDate(year: 1995, month: 1, day: 14, hour: 13, minute: 7, second: 24.920110)
        XCTAssertEqual(date, self.birthdate)
    }

    func test_initWithDate() {
        let date = NSDate(year: 1995, month: 1, day: 14)
        XCTAssertEqual(date, self.birthdate.date)
    }

    func test_initWithTime() {
        let date = NSDate(hour: 7, minute: 8, second: 9) // it doesn't take care of year, month and day
        XCTAssertEqual(date.hour, 7)
        XCTAssertEqual(date.minute, 8)
        XCTAssertEqual(date.second, 9)
    }


    // MARK:

    func test_year() {
        XCTAssertEqual(self.birthdate.year, 1995)
    }

    func test_month() {
        XCTAssertEqual(self.birthdate.month, 1)
    }

    func test_day() {
        XCTAssertEqual(self.birthdate.day, 14)
    }

    func test_hour() {
        XCTAssertEqual(self.birthdate.hour, 13)
    }

    func test_minute() {
        XCTAssertEqual(self.birthdate.minute, 7)
    }

    func test_second() {
        XCTAssertEqual(Float(self.birthdate.second), 24.920110)
    }

    func test_dateWithYear() {
        XCTAssertEqual(self.birthdate.year(2013).year, 2013)
    }

    func test_dateWithMonth() {
        XCTAssertEqual(self.birthdate.month(7).month, 7)
    }

    func test_dateWithDay() {
        XCTAssertEqual(self.birthdate.day(24).day, 24)
    }

    func test_dateWithHour() {
        XCTAssertEqual(self.birthdate.hour(12).hour, 12)
    }

    func test_dateWithMinute() {
        XCTAssertEqual(self.birthdate.minute(34).minute, 34)
    }

    func test_dateWithSecond() {
        XCTAssertEqual(self.birthdate.second(56).second, 56)
    }


    // MARK:

    func test_date() {
        XCTAssertEqual(self.birthdate.date.year, 1995)
        XCTAssertEqual(self.birthdate.date.month, 1)
        XCTAssertEqual(self.birthdate.date.day, 14)
        XCTAssertEqual(self.birthdate.date.hour, 0)
        XCTAssertEqual(self.birthdate.date.minute, 0)
        XCTAssertEqual(self.birthdate.date.second, 0)
    }

    func test_today() {
        XCTAssertEqual(NSDate.today, NSDate().date)
    }


    // MARK:

    func test_afterYears() {
        XCTAssertEqual(3.years.after(self.birthdate), self.birthdate.year(self.birthdate.year + 3))
    }

    func test_afterMonths() {
        XCTAssertEqual(2.months.after(self.birthdate), self.birthdate.month(self.birthdate.month + 2))
    }

    func test_afterDays() {
        XCTAssertEqual(1.day.after(self.birthdate), self.birthdate.day(self.birthdate.day + 1))
    }

    func test_afterHours() {
        XCTAssertEqual(10.hours.after(self.birthdate), self.birthdate.hour(self.birthdate.hour + 10))
    }

    func test_afterMinutes() {
        XCTAssertEqual(11.minutes.after(self.birthdate), self.birthdate.minute(self.birthdate.minute + 11))
    }

    func test_afterSeconds() {
        XCTAssertEqual(12.seconds.after(self.birthdate), self.birthdate.second(self.birthdate.second + 12))
    }

    func test_afterSeconds_float() {
        XCTAssertEqual(13.5.seconds.after(self.birthdate), self.birthdate.second(self.birthdate.second + 13.5))
    }


    // MARK:

    func test_beforeYears() {
        XCTAssertEqual(3.years.before(self.birthdate), self.birthdate.year(self.birthdate.year - 3))
    }

    func test_beforeMonths() {
        XCTAssertEqual(2.months.before(self.birthdate), self.birthdate.month(self.birthdate.month - 2))
    }

    func test_beforeDays() {
        XCTAssertEqual(1.day.before(self.birthdate), self.birthdate.day(self.birthdate.day - 1))
    }

    func test_beforeHours() {
        XCTAssertEqual(10.hours.before(self.birthdate), self.birthdate.hour(self.birthdate.hour - 10))
    }

    func test_beforeMinutes() {
        XCTAssertEqual(11.minutes.before(self.birthdate), self.birthdate.minute(self.birthdate.minute - 11))
    }

    func test_beforeSeconds() {
        XCTAssertEqual(12.seconds.before(self.birthdate), self.birthdate.second(self.birthdate.second - 12))
    }

    func test_beforeSeconds_float() {
        XCTAssertEqual(13.5.seconds.before(self.birthdate), self.birthdate.second(self.birthdate.second - 13.5))
    }

}
