# Test file for "Lab5_atmega1284"


# commands.gdb provides the following functions for ease:
#   test "<message>"
#       Where <message> is the message to print. Must call this at the beginning of every test
#       Example: test "PINA: 0x00 => expect PORTC: 0x01"
#   checkResult
#       Verify if the test passed or failed. Prints "passed." or "failed." accordingly, 
#       Must call this at the end of every test.
#   expectPORTx <val>
#       With x as the port (A,B,C,D)
#       The value the port is epected to have. If not it will print the erroneous actual value
#   setPINx <val>
#       With x as the port or pin (A,B,C,D)
#       The value to set the pin to (can be decimal or hexidecimal
#       Example: setPINA 0x01
#   printPORTx f OR printPINx f 
#       With x as the port or pin (A,B,C,D)
#       With f as a format option which can be: [d] decimal, [x] hexadecmial (default), [t] binary 
#       Example: printPORTC d
#   printDDRx
#       With x as the DDR (A,B,C,D)
#       Example: printDDRB

echo ======================================================\n
echo Running all tests..."\n\n

test "PINA: 0x00 => PORTB: 1, state: Press"
setPINA 0x00
continue 7
expectPORTB 1
expect state Press
checkResult

test "PINA: 0x01 => PORTB: 2, state: Release"
setPINA 0x01
continue 7
expectPORTB 2
expect state Release
checkResult

test "PINA: 0x00, 0x01 => PORTB: 4, state: Release"
setPINA 0x00
continue 2
setPINA 0x01
continue 2
expectPORTB 4
expect state Release
checkResult

test "PINA: 0x00, 0x01 => PORTB: 8, state: Release"
setPINA 0x00
continue 2
setPINA 0x01
continue 2
expectPORTB 8
expect state Release
checkResult

test "indexPatterns: 13, PINA: 0x00, 0x01 => PORTB: 0, state: Release"
set indexPatterns = 13
setPINA 0x00
continue 2
setPINA 0x01
continue 2
expectPORTB 0
expect state Release
checkResult

test "PINA: 0x00, 0x01 => PORTB: 1, state: Release"
setPINA 0x00
continue 2
setPINA 0x01
continue 2
expectPORTB 1
expect state Release
checkResult

# Report on how many tests passed/tests ran
set $passed=$tests-$failed
eval "shell echo Passed %d/%d tests.\n",$passed,$tests
echo ======================================================\n
