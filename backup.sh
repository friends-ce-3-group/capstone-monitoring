#!/bin/bash
aws cloudwatch get-dashboard --region us-west-2 --dashboard-name friends-capstone-temporary-RDS | jq ".DashboardBody" >> friends-capstone-temporary-RDS.json
python backup.py --json_file friends-capstone-temporary-RDS.json
cat friends-capstone-temporary-RDS.json
