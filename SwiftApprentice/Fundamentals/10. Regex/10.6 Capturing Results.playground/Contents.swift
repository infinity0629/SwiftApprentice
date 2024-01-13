import RegexBuilder

let regexWithCapture = Regex {
    OneOrMore {
        "a"..."z"
    }
    Capture {
        OneOrMore {
            CharacterClass.digit
        }
    }
    OneOrMore {
        "a"..."z"
    }
}

let testingString2 = "welc0me to chap7er 10 in sw1ft appren71ce. " + "Th1s chap7er c0vers regu1ar express1ons and regexbu1lder"

for match in testingString2.matches(of: regexWithCapture) {
    print(match.output)
}

for match in testingString2.matches(of: regexWithCapture) {
    let (wordMatch, extractedDigit) = match.output
    print("Full Match: \(wordMatch) | Captured value: \(extractedDigit)")
}



let regexWithStrongType = Regex {
    OneOrMore {
        "a"..."z"
    }
    TryCapture {
        OneOrMore {
            CharacterClass.digit
        }
    } transform: {foundDigits in
        Int(foundDigits)
    }
    OneOrMore {
        "a"..."z"
    }
}

for match in testingString2.matches(of: regexWithStrongType) {
    let (wordMatch, extractedDigit) = match.output
    print("Full Match: \(wordMatch) | Captured value: \(extractedDigit) |  Captured type: \(type(of: extractedDigit))")
}



let repetition = "123abc456def789ghi"

let repeatedCaptures = Regex {
    OneOrMore {
        Capture {
            OneOrMore {
                CharacterClass.digit
            }
        }
        OneOrMore {
            "a"..."z"
        }
    }
}

for match in repetition.matches(of: repeatedCaptures) {
    print(match.output)
}
