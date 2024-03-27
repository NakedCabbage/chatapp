# save this $private_key into a file call "id_rsa" inside  /home/runner/.ssh

#echo $private_key --------------------------------------
# translate python code to shell script 

# save the private key to /home/runner/.ssh from the secrets

# echo "$private_key" > /home/runner/.ssh/id_rsa
# chmod 600 /home/runner/.ssh/id_rsa

# scp -r david@34.42.194.88:/home/chatapp/chatapp/      ./chatapp 
echo test1234 |scp -r ./chatapp/   david@34.71.27.28:/home/david/chatapp/

# login into 34.16.19.16 and run 
echo test1234|ssh -t david@34.71.27.28  "cd ~/chatapp;sudo reflex run;"

# scp: stat remote: No such file or directory
# scp: failed to upload directory ./chatapp to /home/chatapp/chatapp/
# cmd1 | cmd2 
# sends the ouput of cmd1 into the input of cmd2
# cmd1 > file
# sending the output of cmd1, to the file 
