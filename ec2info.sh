#!/bin/bash
c1=""
c2=""
c3=""

c1=$(shuf -i 10-99 -n 1)
c2=$(shuf -i 10-99 -n 1)
c3=$(shuf -i 10-99 -n 1)

color=$c1$c2$c3
bgcolor=$c3$c2$c1'18'

# [ec2-user@ip-172-31-12-137 ~]$ for item in $(curl 169.254.169.254/latest/meta-data); do echo $item ==> $(curl  169.254.169.254/latest/meta-data/$item); done

# ami-id .
# ami-launch-index
# ami-manifest-path
# autoscaling/
# block-device-mapping/
# events/
# hostname .
# identity-credentials/
# instance-action
# instance-id ,
# instance-life-cycle
# instance-type .
# local-hostname .
# local-ipv4 .
# mac .
# metrics/
# network/
# placement/
# profile .
# public-hostname .
# public-ipv4 .
# public-keys/
# reservation-id .
# security-groups .


metalist=(
    "hostname" \
    "instance-id" \
    "instance-type" \
    "local-hostname" \
    "local-ipv4" \
    "public-hostname" \
    "public-ipv4" \    
    "profile" \  
    "security-groups" \  
    "reservation-id" \  
    "ami-id" \  
    "mac" \  
    )



cat > $1 << EoF
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
    </head>

    <body>
        <style>
            body{margin:0;padding:0}
            :root { --color: #$color; --bgcolor: #$bgcolor }
            .main { color: var(--color); background-color: var(--bgcolor);  }
            .label { color: var(--color) }
            .value { color: var(--color); font-weight: bold; }
            .line {padding: .5rem  1rem; text-transform: capitalize}
        </style>
        <div class="main">
EoF



for label in ${metalist[@]}
do
    cat >> $1 << EoF
            <div class="line"> 
                <span class="label">$label:</span> <span class="value">$(curl 169.254.169.254/latest/meta-data/$label):</span> 
            </div>
EoF

done




cat >> $1 << EoF
        </div>
        <div> color: $color </div>
        <div> bgcolor: $bgcolor </div>

    </body>
</html>
EoF



    