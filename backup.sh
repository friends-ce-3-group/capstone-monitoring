#!/bin/bash
aws cloudwatch get-dashboard --region us-west-2 --dashboard-name friends-capstone-temporary-RDS | jq ".DashboardBody" | python -m json.tool