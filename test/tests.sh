#!/usr/bin/env sh
# perform basic tests to ensure speedtest-cli works
#
echo "Executing tests..."

PASSED=0
FAILED=0

check_result () {
  if [ ${1} -eq 0 ]; then
      echo OK - ${2}
      PASSED=$((PASSED+1))
  else
      echo FAIL - ${2}
      FAILED=$((FAILED+1))
  fi
}

# test 1 - pass test
OUTPUT=$(example-app)
check_result ${?} "example-app should run fine"

# test 2 - deliberate failure test
OUTPUT=$(example-app --fail)
check_result ${?} "example-app should run fine"

# output results
echo PASSED: ${PASSED} FAILED: ${FAILED}

# exit with failure if any of the tests didn't pass
if [ ${FAILED} -gt 0 ]; then
  exit 1
fi
exit 0
