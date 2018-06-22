function netcheck
	ping -c4 8.8.8.8 >/dev/null ^/dev/null; and echo "IPv4 up"; or echo "IPv4 down"
	ping -6 -c4 2a00:1450:4001:80f::100f >/dev/null ^/dev/null; and echo "IPv6 up"; or echo "IPv6 down"
	nslookup google.de >/dev/null ^/dev/null; and echo "DNS works"; or echo "DNS doesn't work"
	nslookup google.de 8.8.8.8 >/dev/null ^/dev/null; and echo "DNS (8.8.8.8) works"; or echo "DNS (8.8.8.8) doesn't work"
end
