Date.swift
==========

[![Release](http://img.shields.io/github/release/devxoul/Date.swift.svg?style=flat)](https://github.com/devxoul/Date.swift/releases?style=flat)
[![Build Status](http://img.shields.io/travis/devxoul/Date.swift/master.svg?style=flat)](https://travis-ci.org/devxoul/Date.swift)

A Swift Date Library. Inspired by [Datejs](https://github.com/datejs/Datejs).


Installation
------------

- **For iOS 8+ projects:** Use [CocoaPods](https://cocoapods.org) with Podfile:

    ```ruby
    pod 'Date.swift', '~> 0.1'
    ```


- **For iOS 7 projects:** I recommend you to try [CocoaSeeds](https://github.com/devxoul/CocoaSeeds), which uses source code instead of dynamic frameworks. Sample Seedfile:

    ```ruby
    github 'devxoul/Date.swift', '0.1.0', :files => 'Date/Date.swift'
    ```


At a Glance
-----------

```swift
NSDate(year: 1995, month: 1, day: 14, hours: 13, minutes: 7, seconds: 24.5)    // datetime

NSDate(year: 1995, month: 1, day: 14)   // date
NSDate.date(1995, 1, 14)                // date in shorter

NSDate(hours: 13, minutes: 7, seconds: 24.5)   // time; it doesn't take care of year, month and date.
NSDate.time(13, 7, 24.920110)                  // time in shorter

NSDate.today                    // Returns today's date.

NSDate().year                   // Returns this year.
NSDate().month                  // Returns this month.
NSDate().day                    // Returns today's day.

NSDate().hours                  // Returns current hour.
NSDate().minutes                // Returns current minute.
NSDate().seconds                // Returns current second in Double.

NSDate.today.withYear(2014)     // Returns new date with given year.
NSDate.today.withMonth(3)       // Returns new date with given month.
NSDate.today.withDay(15)        // Returns new date with given day.

NSDate.today.withHours(12).withMinutes(30)  // Returns new date with given hours and minutes.

NSDate.january.first.friday     // Returns first Friday in January.
NSDate.today.second.friday      // Returns second Friday in current month.

NSDate.march.third.friday       // Returns third Friday in March.
NSDate.april.fourth.friday      // Returns fourth Friday in April.

NSDate.today.fifth.friday       // Returns fifth Friday in current month or `nil` if not exists.
NSDate.december.last.sunday     // Returns last Sunday in December.

NSDate.monday                   // Returns Monday in current week.
NSDate.friday                   // Returns Friday in current week.

1.year.after(someDate)          // Returns a new date after 1 year from given date.
3.days.fromNow                  // Returns a new date after 3 days from now.

2.hours.before(someDate)        // Returns a new date before 2 hours from given date.
4.seconds.ago                   // Returns a new date before 4 sconds from now.

someDate + 5.months             // A new date by adding 5 months.
someDate - 6.minutes            // A new date by subtracting 6 minutes.
```


LICENSE
-------

**Date.swift** is under MIT license. See the LICENSE file for more info.
