# This Puppet script sets up the SSH client configuration file.
# It configures the client to use the private key ~/.ssh/school
# and refuses to authenticate using a password.
Host *
        IdentityFile /home/ubuntu/.ssh/school
        PasswordAuthentication no
