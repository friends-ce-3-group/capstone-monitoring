#!/bin/bash
region=us-west-2
dashboards=(
    friends-capstone-temporary-RDS 
    friends-capstone-temporary-ManagementEvents
    friends-capstone-temporary-CardsDelivery
    friends-capstone-temporary-Thumbnail
    friends-test-main
)
for dash in "${dashboards[@]}"
do
    dashfile="./cloudwatch/$dash.json"
    aws cloudwatch get-dashboard --region $region --dashboard-name $dash | jq ".DashboardBody" > $dashfile
    python3 backup.py --json_file $dashfile
    echo ""
    echo "$dash:"
    cat $dashfile
done