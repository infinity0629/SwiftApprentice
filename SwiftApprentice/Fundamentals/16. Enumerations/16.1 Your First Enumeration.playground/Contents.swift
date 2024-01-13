import Cocoa

//enum Month {
//    case january
//    case february
//    case march
//    case april
//    case may
//    case june
//    case july
//    case august
//    case september
//    case october
//    case november
//    case december
//}
    
enum Month {
  case january, february, march, april, may, june, july, august, september, october, november, december
}

func semester(for month: Month) -> String {
    
//    switch month {
//    case Month.august, Month.september, Month.october, Month.november, Month.december:
//        return "Autumn"
//    case Month.january, Month.february, Month.march, Month.april, Month.may:
//        return "Spring"
//    default:
//        return "Not in the school year"
//    }
    
//    switch month {
//    case .august, .september, .october, .november, .december:
//        return "Autumn"
//    case .january, .february, .march, .april, .may:
//        return "Spring"
//    default:
//        return "Not in the school year"
//    }
    
    switch month {
    case .august, .september, .october, .november, .december:
        return "Autumn"
    case .january, .february, .march, .april, .may:
        return "Spring"
    case .june, .july:
        return "Not in the school year"
    }
}

var month = Month.april
semester(for: month)

month = .september
semester(for: month)
