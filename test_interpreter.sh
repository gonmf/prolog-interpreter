#!/bin/bash

# rm tests/*.out

for i in ./tests/*.dl; do
  output_file=${i%.dl}.out
  test_name=${i%.dl}
  test_name=${test_name#./tests/}
  echo "Test ${test_name}"

  # To create all .out files
  # ./dakilang --disable-colors -c $i > $output_file

  diff -y --suppress-common-lines <(./dakilang --disable-colors -c $i) $output_file || echo "Test FAILED"
done
