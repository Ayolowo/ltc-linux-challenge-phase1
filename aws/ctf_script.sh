#!/bin/bash

# This script contains the commands for solving tasks related to LTC CTF challenges.

echo "--------------------------------------------------------------------------"
echo "1. Find a hidden file"
echo "--------------------------------------------------------------------------"
# Access the hidden file and display its content
cat ctf_challenges/.hidden_flag

echo "--------------------------------------------------------------------------"
echo "2. Locate a file with 'secret' in its name"
echo "--------------------------------------------------------------------------"
# Find files containing 'secret' in their name
sudo find / -type f -name "*secret*"
# Display contents of a specific secret file
cat ./very_secret_file.txt

echo "--------------------------------------------------------------------------"
echo "3. Find the largest file in a specific directory"
echo "--------------------------------------------------------------------------"
# Find and display the largest file in /var/log
sudo find /var/log/ -type f -exec du -h {} + | sort -rh | head -n 1
# Check for large files in the journal directory
cd /var/log/journal/97a372c89b40466b82e74b8562e66a97/ || exit 1
du -sh * | sort -rh
# Search journal logs for the flag
sudo journalctl | grep -i "CTF{size_matters_in_linux}"

echo "--------------------------------------------------------------------------"
echo "4. Identify a user with a specific UID"
echo "--------------------------------------------------------------------------"
# Find the user with UID 1001
grep ':1001:' /etc/passwd
# Switch to the user and navigate to their home directory
sudo su - ctf_user -c "cd /home/ctf_user && find . -type f -name '*flag*' && cat flag.txt"

echo "--------------------------------------------------------------------------"
echo "5. Locate a file with specific permissions"
echo "--------------------------------------------------------------------------"
# Check permissions of a specific file owned by root
sudo ls -l /root/everyone_can_access_me
# Display the file's contents
sudo cat /root/everyone_can_access_me

echo "--------------------------------------------------------------------------"
echo "6. Find a process running on a specific port"
echo "--------------------------------------------------------------------------"
# Check for processes using port 8080
sudo ps aux | grep -i 8080
# Navigate to a directory and inspect the relevant script
cd ctf_challenges/ || exit 1
cat port_8080_service.sh

echo "--------------------------------------------------------------------------"
echo "7. Decode a base64 encoded message"
echo "--------------------------------------------------------------------------"
# Decode the base64 encoded message from the file
cd ctf_challenges/ || exit 1
base64 -d encoded_flag.txt > decoded_file.txt
# Display the decoded content
cat decoded_file.txt

echo "--------------------------------------------------------------------------"
# End of script
echo "Script execution complete!"
