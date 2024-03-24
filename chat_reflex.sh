# ssh david@34.16.19.16
ls
cd /
ls 
cd ~/CMD 
pwd
scp  /path/to/local/folder username@remote_host:/path/to/destination

scp -r david@34.42.194.88:/home/chatapp/chatapp/ ./chatapp  
scp -r ./* david@34.42.194.88:/home/david/
# login into 34.16.19.16 and run 
ssh -t david@34.16.19.16 "cd ../; cd chatapp;sudo reflex run;"

new = 34.42.194.88 