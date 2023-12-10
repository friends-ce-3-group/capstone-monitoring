#!/bin/bash
region=us-west-2
dashboards=(
    friends-capstone-APIGateway-Thumbnail-terraform
    friends-capstone-CardsDelivery-terraform
    friends-capstone-ecs-terraform
    friends-capstone-rds-dashboard-terraform
    friends-capstone-summary-dashboard-terraform   
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