printf "DISCLAIMER: This script sends the first 5 characters of a SHA1 hash of the password you type below to the haveibeenpwned API.\nThe actual password you enter never leaves this computer.\nIt can still be intercepted by keyloggers, malware, or someone looking over your shoulder.\n\n"
read -s -p "Password: " password
printf "\n"
fullhash=$(echo -n $password | sha1sum | awk '{print $1}')
prefix=$(echo $fullhash | head -c 5)
suffix=$(echo $fullhash | tail -c 36)
curl -s https://api.pwnedpasswords.com/range/$prefix -o output
grep -i $suffix output | cut -d ':' -f2
rm output
