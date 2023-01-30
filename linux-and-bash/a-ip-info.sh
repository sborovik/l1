#! /bin/bash
list_ip_addr(){
    ADDR=`ip a | grep eno1 | grep inet | awk '{print $2}'`
    sudo nmap -sn $ADDR
}
 
list_ports(){
    PORTS=`ip a | grep eno1 | grep inet | awk '{print $2}' | cut -d/ -f1`
    sudo nmap -sT -O $PORTS
}  

case "$1" in
  --all)
    echo "You choose --all"
	echo "The IP addresses and symbolic names of all hosts in the current subnet"
    list_ip_addr
	;;
  --target)
    echo "You choose --target"
    echo "List of open system TCP ports"
    list_ports    
	;;
  *)
    echo "Enter one of the possible keys"
    echo "--all key displays the IP addresses and symbolic names of all hosts in the current subnet"
	echo "--target key displays a list of open system TCP ports."
	;;
esac
