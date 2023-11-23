#!/bin/bash
dashboards=(
    friends-capstone-temporary-RDS 
    friends-capstone-temporary-ManagementEvents
    friends-capstone-temporary-CardsDelivery
    friends-capstone-temporary-Thumbnail
    friends-test-OMG
)
for dash in "${dashboards[@]}"
do
    dashfile="$dash.json"
    aws cloudwatch get-dashboard --region us-west-2 --dashboard-name $dash | jq ".DashboardBody" > $dashfile
    python3 backup.py --json_file $dashfile
    echo "\n$dash:\n"
    cat $dashfile
done