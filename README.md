# MyLerning
## First we are create infrastucteure with network/
There are 3 vm:
    vm1-Web server on nginx\
    vm2-Router\
    vm3-DBserver like mysql it would be postgres, for example

***Network-vm1-web-server***
|       subnet      | network address  |  min address  |  max address  | total hosts  |   broadcast   |
|-------------------|:----------------:|--------------:|--------------:|------------- |--------------:|
| External net      | DHCP             |               |               |              |               |
| Menegment net     | 10.10.11.0/24    | 10.10.11.1    | 10.10.11.254  |     254      | 10.10.11.255  |
| Intranet #1       | 10.10.12.0/30    | 10.10.12.1    | 10.10.12.2    |     2        | 10.10.12.3    |

| Network adresses  |      En1         |    En 2       |    En3        |     En 4     |
|-------------------|:----------------:|--------------:|--------------:|-------------:| 
|    Address        |  Bridge En1      | 10.10.11.1    | 10.10.12.1    |              |

***Rules for host***
disable default route\
ip route 0.0.0.0/0 via En1\
ip route 10.10.11.0/24 via 10.10.11.2 #there're not needet this settings, but i'm need to show how it's works\
ip route 10.10.12.0/30 via 10.10.12.2 #there're not needet this settings, but i'm need to show how it's works\
iptables routing to other host in our circuit to managmet or we can create some vm to access from menegment net
___

***Network-vm2-router***
|       subnet      | network address  |  min address  |  max address  | total hosts  |   broadcast   |
|-------------------|:----------------:|--------------:|--------------:|-------------:|--------------:|
| Menegment net     | 10.10.11.0/24    | 10.10.11.1    | 10.10.11.254  |     254      | 10.10.11.255  |
| Intranet #1       | 10.10.12.0/30    | 10.10.12.1    | 10.10.12.2    |     2        | 10.10.12.3    |
| Intranet #2       | 10.10.12.4/30    | 10.10.12.5    | 10.10.12.6    |     2        | 10.10.12.7    |
| VPN for Moitoring | Other network    |               |               |              |               |

| Network adresses  |      En1         |    En2        |    En3        |     En4      |
|-------------------|:----------------:|--------------:|--------------:|-------------:| 
|    Address        |                  | 10.10.11.2    | 10.10.12.2    | 10.10.12.5   |

***Rules for host***
disable default route\
ip route 0.0.0.0/0 via 10.10.11.1\
ip route 10.10.12.3/24 via 10.10.12.1 #there're not needet this settings, but i'm need to show how it's works\
ip route 10.10.12.7/30 via 10.10.12.6 #there're not needet this settings, but i'm need to show how it's works
___

***Network-vm3-Database-server***
|       subnet      | network address  |  min address  |  max address  | total hosts  |   broadcast   |
|-------------------|:----------------:|--------------:|--------------:|-------------:|--------------:|
| Menegment net     | 10.10.11.0/30    | 10.10.11.1    | 10.10.11.254  |     254      | 10.10.11.255  |
| Intranet #2       | 10.10.12.4/30    | 10.10.12.5    | 10.10.12.6    |     2        | 10.10.12.7    |

| Network adresses  |      En1         |    En2        |    En3        |     En4      |
|-------------------|:----------------:|--------------:|--------------:|-------------:| 
|    Address        |                  | 10.10.11.3    | 10.10.12.6    |              |

***Rules for host***
disable default route\
ip route 0.0.0.0/0 via 10.10.12.5