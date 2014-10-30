#!/bin/bash

kill -s 11 $(ps aux | grep '[s]egfault' | awk '{print $2}')
