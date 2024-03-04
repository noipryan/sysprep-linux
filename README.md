# sysprep-linux
Script for resetting ssh host keys and clearing machine ID

Script is based on systemd unit file from:
[https://www.learnlinux.tv/resetting-openssh-host-keys-the-easy-method/].(https://www.learnlinux.tv/resetting-openssh-host-keys-the-easy-method/).

## Usage

Download the script, make executable, and run:
```shell
$ wget -O sysprep-linux.sh https://raw.githubusercontent.com/noipryan/sysprep-linux/main/sysprep-linux.sh 

$ chmod +x sysprep-linux.sh

$ ./sysprep-linux.sh
```

Run the script as needed after installing software / updating the gold image






