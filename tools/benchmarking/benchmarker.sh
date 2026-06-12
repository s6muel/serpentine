#!/usr/bin/env bash

# get room name
printf "Network state (e.g., pre/post): "
read NETWORK_STATE
printf "Room name: "
read ROOM_NAME
printf "LAN host IP: "
read LAN_HOST
printf "Gateway IP: "
read GATEWAY_IP
printf "Wired connection [y/N]? "
read CONN_TYPE

if [[ "${CONN_TYPE,,}" == "y" ]]; then
    UDP_SPEED="700M"
    CONN_TYPE="wired"
else
    UDP_SPEED="700M"
    CONN_TYPE="wifi"
fi

mkdir $NETWORK_STATE-benchmarks
cd $NETWORK_STATE-benchmarks

WAIT_SECS=300
RUNS=3

for RUN in $(seq 1 $RUNS); do
    printf "=== Run $RUN of $RUNS ===\n"

    printf "Running TCP benchmark via %s for %s\n" "$CONN_TYPE" "$ROOM_NAME"
    iperf3 -c $LAN_HOST -t 30 | tee "${CONN_TYPE}-${ROOM_NAME}-tcp-$(date +%y%m%d%H%M).txt"

    printf "Running UDP benchmark via %s for %s (${UDP_SPEED})\n" "$CONN_TYPE" "$ROOM_NAME"
    iperf3 -c $LAN_HOST -u -b $UDP_SPEED -t 30 -p 5201 --cport 5202 | tee "${CONN_TYPE}-${ROOM_NAME}-udp-$(date +%y%m%d%H%M).txt"

    printf "Running gateway latency benchmark via %s for %s\n" "$CONN_TYPE" "$ROOM_NAME"
    ping -c 100 $GATEWAY_IP | tee "${CONN_TYPE}-${ROOM_NAME}-gwping-$(date +%y%m%d%H%M).txt"

    printf "Running LAN latency benchmark via %s for %s\n" "$CONN_TYPE" "$ROOM_NAME"
    ping -c 100 $LAN_HOST | tee "${CONN_TYPE}-${ROOM_NAME}-lanping-$(date +%y%m%d%H%M).txt"

    printf "Running WAN latency benchmark via %s for %s\n" "$CONN_TYPE" "$ROOM_NAME"
    ping -c 100 1.1.1.1 | tee "${CONN_TYPE}-${ROOM_NAME}-ipping-$(date +%y%m%d%H%M).txt"

    printf "Run $RUN/$RUNS complete...\n"
    if [[ $RUN -lt $RUNS ]]; then
        for i in $(seq $WAIT_SECS -1 1); do
            printf "\rNext run in %3d seconds..." "$i"
            sleep 1
        done
        printf "\n"
    fi
done

printf "All runs complete."

# vim: syntax=sh cc=80 tw=79 ts=4 sw=4 sts=4 et sr

