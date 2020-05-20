# LCS lottery

The LCS lottery lets people enter with a ticket number into a lottery. A winning number is
drawn and every person gets credits in the amount of the longest common subsequence
(LCS) with their own ticket number. The LCS is the longest (not necessarily contiguous)!
shared subsequence in two strings.

Every person (uniquely identified by last name, first
name and country) may enter with as many tickets as s/he likes. The list of participating
players and their lottery numbers is supplied as a:
 - UTF-8, comma separated text file
 - no quotes around fields, fields themselves will not contain commas
 - field order is last name, first name, country, ticket number, names may contain
spaces

# Usage
`$ ruby lcs_lottery.rb ./tickets.csv 45600012`
