# passwordpwn.sh
A simple bash script that checks passwords against the HaveIBeenPwned API and tells you how many times that password appears in HaveIBeenPwned's dataset.
  If it's a high number, the password is in common use and will likely be vulnerable to dictionary/brute-force attacks, and should not be used.

## Setup
`curl "https://raw.githubusercontent.com/ryankrage77/passwordpwn.sh/master/passwordpwn.sh" > passwordpwn.sh`
  `chmod +x passwordpwn.sh`

## Usage
`./passwordpwn.sh`
  Enter a password when prompted.
  It will print the number of times that the password has been seen in HaveIBeenPwned's dataset.
  If it prints nothing, no match was found and the password has not been seen in the dataset.
