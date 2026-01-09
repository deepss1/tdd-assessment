# String Calculator TDD Kata

![Coverage](https://img.shields.io/badge/coverage-100%25-brightgreen)
![Build Status](https://img.shields.io/badge/test-passing-brightgreen)
![Language](https://img.shields.io/badge/dart-3.10.7-blue)

A production-grade implementation of the famous String Calculator Kata, demonstrating strict **Test-Driven Development (TDD)** practices and clean architecture principles.

## 🚀 Features

This calculator handles complex string parsing scenarios including:

- **Basic Arithmetic**: Sums comma-separated integers.
- **Robust Parsing**: Handles newlines (`\n`) and custom delimiters seamlessly.
- **Advanced Delimiters**:
  - Custom single-character delimiters (e.g., `//;\n1;2`)
  - Multi-character delimiters (e.g., `//[***]\n1***2***3`)
  - Multiple different delimiters (e.g., `//[*][%]\n1*2%3`)
  - **Multiple multi-character delimiters** (e.g., `//[foo][bar]\n1foo2bar3`)
- **Safety**: 
  - Ignores empty entries caused by consecutive delimiters (`1,,2` → 3).
  - Ignores numbers > 1000.
  - Throws informative exceptions for negative numbers, listing all offenders.

## 🛠️ Technical Approach

This project was built using the **Red-Green-Refactor** cycle. 

### Key Design Decisions
1.  **Unified Regex Parsing**: Instead of messy `if-else` chains for different delimiter types, the solution compiles all delimiters into a single `RegExp`. This makes the `add` method purely functional and declarative.
2.  **Immutability**: The code prioritizes `final` variables and pure functions to reduce side effects.
3.  **Defensive Coding**: 
    - `RegExp.escape()` is used to prevent special characters (like `*` or `+`) from crashing the parser.
    - Boundary checks (e.g., inclusive vs exclusive limits) are explicitly tested.

## 🧪 Running Tests

This project uses the standard `test` package.

**Run all tests:**
```bash
dart test
```

**Run with expanded output (to see individual test cases):**
```bash
dart test -r expanded
```

## ✅ Test Results
![Test Results](screenshots\test_results.png)

## 📂 Project Structure

```
string_calculator_kata/
├── lib/
│   ├── string_calculator_kata.dart  # Main logic (Parse -> Filter -> Reduce)
└── test/
│   └── string_calculator_kata_test.dart  # Comprehensive test suite
└── README.md
```

## 📝 Commit History
The git log of this repository serves as proof of the TDD process, featuring atomic commits tagged with `test: [RED]`, `feat: [GREEN]`, and `refactor` steps.

_Implemented as part of the Incubyte TDD Assessment._