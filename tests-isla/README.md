isla-axiomatic tests
--------------------

This directory contains the tests from tests/ifetch/HAND/
compiled with isla-litmus with some hand modifications
for self-modifying regions and integer types,
so they can run in the isla-axiomatic tool.

Note that not all of the tests run, specifically those with infinite loops.

This is (hopefully) temporary; isla-axiomatic should eventually be able to run pure .litmus format tests one day.