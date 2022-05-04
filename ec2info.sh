#!/bin/bash
c1=""
c2=""
c3=""

c1=$(shuf -i 10-99 -n 1)
c2=$(shuf -i 10-99 -n 1)
c3=$(shuf -i 10-99 -n 1)

color="$c1$c2$c3"
bgcolor="$c3$c2$c1"
# [ec2-user@ip-172-31-12-137 ~]$ for item in $(curl 169.254.169.254/latest/meta-data); do echo $item ==> $(curl  169.254.169.254/latest/meta-data/$item); done

# ami-id
# ami-launch-index
# ami-manifest-path
# autoscaling/
# block-device-mapping/
# events/
# hostname .
# identity-credentials/
# instance-action
# instance-id
# instance-life-cycle
# instance-type
# local-hostname .
# local-ipv4
# mac
# metrics/
# network/
# placement/
# profile
# public-hostname .
# public-ipv4 .
# public-keys/
# reservation-id
# security-groups


metalist=(
    "hostname" \
    "instance-id" \
    "local-hostname" \
    "local-ipv4" \
    "public-hostname" \
    "public-ipv4" \    
    )






cat > index.html << EoF
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
            :root { --color: $color; --bgcolor: $bg-color }
            .main { color: var(--color); background-color: var(--bgcolor);  }
            .label { color: var(--color) }
            .value { color: var(--color) }
        </style>
        <div class="main">
EoF



for label in ${metalist[@]}
do
    cat >> index.html << EoF
        <div> <span class="label">$label:</span> </div>
EoF

done






cat >> index.html << EoF
        </div>
    </body>
</html>
EoF



    