#! /bin/bash	
SOURCE_PATH='example_log.log'
TARGET_PATH='b-analyzer-results.txt'

exec 1>$TARGET_PATH

echo "1. From which ip were the most requests?"
echo "Numbers of requests and IP address"
awk '{ print $1}' $SOURCE_PATH | sort | uniq -c | sort -nr | head -n1

echo -en '\n'
echo "2. What is the most requested page? "
echo "Number of requests and page"
awk {'print $11'} $SOURCE_PATH | grep "http" | sort | uniq -c | sort -rn | head -n1

echo -en '\n'
echo "3. How many requests were there from each ip? "
echo "Numbers of requests per ip"
awk '{print $2 " " $1}' $SOURCE_PATH | sort | uniq -c | sort -nr |  head -n10
	
echo -en '\n'
echo "4. What non-existent pages were clients referred to? "
echo "Requests with code 404 - indicates a missing resource"
grep " 404 "  $SOURCE_PATH | awk {' print $7 '} | sort | uniq | sort -rn | head -n1

echo -en '\n'
echo "5. What time did site get the most requests?"
echo "Most at: "
awk {'print $4 $5'} $SOURCE_PATH | sort | uniq -c | sort -rn | head -n3

echo -en '\n'
echo "6. What search bots have accessed the site? (IP + UA)"
echo "Results: "
grep 'HTTP[^"]*" .*bot' $SOURCE_PATH  | awk '{print $1 " " $12 " " $13 " " $15 " " $16}' | sort | uniq -c | sort -rn | head
