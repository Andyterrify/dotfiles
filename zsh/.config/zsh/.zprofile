



if [ ! -f /tmp/.zprofile_login_run ]; then
    eval "$(ssh-agent -s)"
    ssh-add $HOME/.ssh/personal

    ## connect remote drive
    sshfs -o ssh_command="ssh -i ~/.ssh/personal" avasile@kraken.home.lan:/bigdata ~/sshfs/kraken/bigdata
    sshfs -o ssh_command="ssh -i ~/.ssh/personal" avasile@kraken.home.lan:/vault ~/sshfs/kraken/vault
    
    # Create the flag file
    touch /tmp/.zprofile_login_run
fi
