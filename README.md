# Password Tools
A collection of scripts & other tools I use relating to passwords.

## passwordpwn
A simple script that checks passwords against the HaveIBeenPwned API and tells you how many times that password appears in HaveIBeenPwned's dataset.
  If it's a high number, the password is in common use and will likely be vulnerable to dictionary/brute-force attacks, and should not be used.  
  Thanks to [natfan](https://github.com/Natfan) there's a powershell version too. Thanks natfan!

### Setup (bash version)
`curl "https://raw.githubusercontent.com/ryankrage77/passwordpwn.sh/master/passwordpwn.sh" > passwordpwn.sh`  
OR  
`wget "https://raw.githubusercontent.com/ryankrage77/passwordpwn.sh/master/passwordpwn.sh"`

`chmod +x passwordpwn.sh`

### Usage (bash version)
`./passwordpwn.sh`

Enter a password when prompted.

It will print the number of times that the password has been seen in HaveIBeenPwned's dataset.

If it prints nothing, no match was found and the password has not been seen in the dataset. *This does not make it a good password!* It just means it hasn't been seen in the dataset.  
For guidance on creating a strong password, see https://pages.nist.gov/800-63-3/sp800-63b.html (or a summary of it, see https://securityboulevard.com/2020/05/a-brief-summary-of-nist-password-guidelines/).
