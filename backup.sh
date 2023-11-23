#!/bin/bash
body=aws cloudwatch get-dashboard --region us-west-2 --dashboard-name friends-capstone-temporary-RDS | jq ".DashboardBody"
echo $body
echo "----------------------------"
echo $body | python -m json.tool