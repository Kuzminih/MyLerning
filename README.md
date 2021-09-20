# MyLerning
## First we are create infrastucteure with network/
There are 3 vm:
    vm1-Web server on nginx\
    vm2-Router\
    vm3-DBserver like mysql it would be postgres, for example

***Network-vm1-web-server***
|       subnet      | network address  |  min address  |  max address  | total hosts  |   broadcast   |
|-------------------|:----------------:|--------------:|--------------:|------------- |--------------:|
| External net      | 10.10.10.0/30    | 10.10.10.1    | 10.10.10.2    |     2        | 10.10.10.11   |
| Menegment net     | 10.10.11.0/24    | 10.10.11.1    | 10.10.11.254  |     254      | 10.10.11.255  |
| Intranet #1       | 10.10.12.0/30    | 10.10.12.1    | 10.10.12.2    |     2        | 10.10.12.127  |

| Network adresses  |      Nic1        |    Nic2       |    Nic3       |     Nic4     |
|-------------------|:----------------:|--------------:|--------------:|-------------:| 
|    Address        |    10.10.10.1    | 10.10.11.1    | 10.10.12.1    |              |

***Network-vm2-router***
|       subnet      | network address  |  min address  |  max address  | total hosts  |   broadcast   |
|-------------------|:----------------:|--------------:|--------------:|-------------:|--------------:|
| Menegment net     | 10.10.11.0/24    | 10.10.11.1    | 10.10.11.254  |     254      | 10.10.11.255  |
| Intranet #1       | 10.10.12.0/30    | 10.10.12.1    | 10.10.12.2    |     2        | 10.10.12.127  |
| Intranet #2       | 10.10.12.4/30    | 10.10.12.5    | 10.10.12.6    |     2        | 10.10.12.255  |
| VPN for Moitoring | Other network    |               |               |              |               |

| Network adresses  |      Nic1        |    Nic2       |    Nic3       |     Nic4     |
|-------------------|:----------------:|--------------:|--------------:|-------------:| 
|    Address        |                  | 10.10.11.2    | 10.10.12.1    | 10.10.12.5   |

***Network-vm3-Database-server***
|       subnet      | network address  |  min address  |  max address  | total hosts  |   broadcast   |
|-------------------|:----------------:|--------------:|--------------:|-------------:|--------------:|
| Intranet #1       | 10.10.12.0/30    | 10.10.12.1    | 10.10.12.2    |     2        | 10.10.12.127  |
| Intranet #2       | 10.10.12.4/30    | 10.10.12.5    | 10.10.12.6    |     2        | 10.10.12.255  |

| Network adresses  |      Nic1        |    Nic2       |    Nic3       |     Nic4     |
|-------------------|:----------------:|--------------:|--------------:|-------------:| 
|    Address        |                  | 10.10.12.2    | 10.10.12.6    |              |
