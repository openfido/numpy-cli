. $(find .. -name assert.sh -print)

numpy savetxt output.csv "1,2,3"
numpy savetxt output.csv "1,2,3" fmt='%g' delimiter=,
numpy savetxt output.csv "1,2,3" fmt='%g' delimiter=, newline=';'
numpy savetxt output.csv "1,2,3" fmt='%g' delimiter=, newline=';' footer=';;'
numpy savetxt output.csv "1,2,3" fmt='%g' delimiter=, newline=';' footer=';;' comments='#'
numpy savetxt output.csv "1,2,3" fmt='%g' delimiter=, newline=';' footer=';;' comments='#' encoding=utf-8
assert $(cat output.csv) = "1,2,3;#;;;"
