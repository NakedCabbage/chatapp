# save this $private_key into a file call "id_rsa" inside  /home/runner/.ssh

#echo $private_key --------------------------------------
# translate python code to shell script 

# save the private key to /home/runner/.ssh from the secrets
mkdir .ssh 
echo "$private_key_64" | openssl base64 -A -d > /home/runner/.ssh/id_rsa 
chmod 600 /home/runner/.ssh/id_rsa

# scp -r david@34.42.194.88:/home/chatapp/chatapp/      ./chatapp 
scp -r ./chatapp/   david@34.125.7.139:/home/david/chatapp/

# login and run 
ssh -t david@34.125.7.139  " source venv/bin/activate; cd ~/chatapp;  reflex run;"

