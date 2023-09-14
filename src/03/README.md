## Part 3. Visual output design for the system research script

**== Task ==**

Write a bash script. Use the script from Part 2 and remove the part where the data is saved to a file.  The script is run with 4 parameters. The parameters are numeric. From 1 to 6, for example:  
`script03.sh 1 3 4 5`

Colour designations: (1 - white, 2 - red, 3 - green, 4 - blue, 5 - purple, 6 - black)

**Parameter 1** is the background of the value names (HOSTNAME, TIMEZONE, USER etc.)  
**Parameter 2** is the font colour of the value names (HOSTNAME, TIMEZONE, USER etc.)  
**Parameter 3** is the background of the values (after the '=' sign)  
**Parameter 4** is the font colour of the values (after the '=' sign)

The font and background colours of one column must not match.  
If matching values are entered, there must be a message describing the problem and offering to call the script again.
After the message output, the program should exit correctly.