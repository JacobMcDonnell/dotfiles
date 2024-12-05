import datetime
now = datetime.datetime.now()

finalsDate = datetime.datetime(2023, 5, 1, 0, 0, 0, 0)
breakDate = datetime.datetime(2023, 3, 3, 15, 0, 0, 0)
def getDays(date, name):
    daysLeft = date - now

    weeks = daysLeft.days // 7
    days = daysLeft.days % 7
    minutes = daysLeft.seconds // 60
    hours = minutes // 60
    minutes %= 60

    if (weeks < 0):
        return f"{name.upper()} WEEK"
    return f"{weeks} weeks {days} days and {hours} hours until {name} week"

output = f"{getDays(finalsDate, 'finals')}"
#output += f"{getDays(breakDate, 'break')}"


print(output)
