import subprocess
import json

dashboards = [
 'friends-capstone-temporary-RDS'
]

for dashboard in dashboards:
    print("running")
    stdout = subprocess.check_output(["cmd", "/c", 'aws', 'cloudwatch', 'get-dashboard', 
                            '--region', 'us-west-2',
                            '--dashboard-name', dashboard, 
                            '|', 'jq', '.DashboardBody'])


    parsed = json.loads(stdout.decode())
    # print(parsed)
    print(json.dumps(parsed, ensure_ascii=False, indent=4))

    # with open(r"D:/repos/learning/friends-ce-3-group/capstone-monitoring/test_out.json", "w") as f:
    #     json.dumps(parsed, f, ensure_ascii=False, indent=4)

