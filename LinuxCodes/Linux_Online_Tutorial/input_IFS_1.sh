#!/bin/bash

nameservers="ns1.nixcraft.net ns2.nixcraft.net ns3.nixcraft.net"

read -r ns1 ns2 ns3 <<< "$nameservers"

echo "DNS Server #1 $ns1"
echo " #2 $ns2"
echo " #3 $ns3"
