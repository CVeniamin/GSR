$TTL   60000
@               IN      SOA     com.    root.com. (
                        2017041101 ; serial
                        28800 ; refresh
                        14400 ; retry
                        3600000 ; expire
                        0 ; negative cache ttl
                        )

@               IN      NS      ns.com.
ns.com.	        IN	    A	      10.0.0.22

isp		          IN 	    NS	    ns.isp.com.
ns.isp.com.     IN      A       10.0.0.25
