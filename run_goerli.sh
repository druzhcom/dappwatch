#!/bin/bash

sudo systemctl daemon-reload
sudo systemctl start geth.service
sudo systemctl start lighthousebeacon.service