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

test "PINA: 0xFF => PORTC: 7, state: Press"
set state = Release
set count = 0x07
setPINA 0xFF
continue 7
expectPORTC 7
expect state Press
checkResult

test "PINA: 0xFE => PORTC: 8, state: Release"
set state = Press
set count = 0x07
setPINA 0xFE
continue 7
expectPORTC 8
expect state Release
checkResult

test "PINA: 0xFD => PORTC: 6, state: Release"
set state = Press
set count = 0x07
setPINA 0xFD
continue 7
expectPORTC 6
expect state Release
checkResult

test "PINA: 0xFC => PORTC: 6, state: Release"
set state = Press
set count = 0x07
setPINA 0xFC
continue 7
expectPORTC 0
expect state Release
checkResult

test "PINA: 0xFE, 0xFF, 0xFE, 0xFF, 0xFE => PORTC: 9, state: Release"
set state = Release
set count = 0x07
setPINA 0xFE
continue 2
setPINA 0xFF
continue 2
setPINA 0xFE
continue 2
setPINA 0xFF
continue 2
setPINA 0xFE
continue 5
expectPORTC 9
expect state Release
checkResult

test "PINA: 0xFD, 0xFF, 0xFD, 0xFF, 0xFD, count: 2 => PORTC: 0, state: Release"
set state = Release
set count = 0x02
setPINA 0xFD
continue 2
setPINA 0xFF
continue 2
setPINA 0xFD
continue 2
setPINA 0xFF
continue 2
setPINA 0xFD
continue 5
expectPORTC 0
expect state Release
checkResult

# Report on how many tests passed/tests ran
set $passed=$tests-$failed
eval "shell echo Passed %d/%d tests.\n",$passed,$tests
echo ======================================================\n
