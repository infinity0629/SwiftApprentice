import RegexBuilder // iOS 16

let newlettersAndNumbers = Regex {
    OneOrMore { "a"..."z" }
    OneOrMore { .digit }
}

/*
 \d = CharacterClass.digit.
 \w = CharacterClass.word.
 \s = CharacterClass.whitespace.
 \D = CharacterClass.digit.inverted.
 \W = CharacterClass.word.inverted.
 \S = CharacterClass.whitespace.inverted.
 . = CharacterClass.any.
 \b = Anchor.wordBoundary.
 [ - ] = Directly using a range of characters like "m"..."r" or "4"..."8".
 [ ] = CharacterClass.anyOf("AEIOUaeiou").
 | = ChoiceOf { } This is more convenient for longer expressions.
 + = OneOrMore { }.
 ? = Optionally { }.
 * = ZeroOrMore { }.
 {n,} = Repeat(n...) { }.
 {n,m} = Repeat(n...m) { }.
 */



// 可以用 RegexBuilder 表示表达式：/\b[a-z]+[0-9]*\b|\b[a-z]*[0-9]+\b/
let newFixedRegex = Regex {
    Anchor.wordBoundary
    ChoiceOf {
        Regex {
            OneOrMore {
                "a"..."z"
            }
            ZeroOrMore {
                .digit
            }
        }
        Regex {
            ZeroOrMore {
                "a"..."z"
            }
            OneOrMore {
                .digit
            }
        }
    }
    Anchor.wordBoundary
}
