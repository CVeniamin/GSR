#!/usr/bin/bash
screen -dmS monitor ssh -L 8080:192.168.0.2:22 admin@10.0.2.83
