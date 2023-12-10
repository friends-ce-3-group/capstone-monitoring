#!/bin/bash
region=us-west-2
dashboards=(
    friends-capstone-rds-dashboard 
    friends-capstone-MgtEvents
    friends-capstone-CardsDelivery
    friends-capstone-APIGateway-Thumbnail
    friends-capstone-summary-dashboard
    friends-capstone-ecs
    friends-capstone-ecs-prometheus
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