import datetime
now = datetime.datetime.now()

finalsDate = datetime.datetime(2022, 12, 12, 0, 0, 0, 0)
daysLeft = finalsDate - now

weeks = daysLeft.days // 7
days = daysLeft.days % 7
minutes = daysLeft.seconds // 60
hours = minutes // 60
minutes %= 60
seconds = daysLeft.seconds % 60

output = f"{weeks} weeks {days} days {hours} hours {minutes} minutes and {seconds} seconds until finals week"

if (weeks <=0):
	output = "FINALS WEEK"

print(output)
