#!/usr/bin/bash
screen -dmS fileServer ssh -L 8081:192.168.0.3:22 admin@10.0.2.83
