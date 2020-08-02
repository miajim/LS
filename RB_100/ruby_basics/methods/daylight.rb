# LS Ruby Basics Exercise - Methods: Day or Night?
# 7/30/20 

daylight = [true, false].sample

def time_of_day(daylight)
	puts daylight ? "It's daytime!" : "It's nighttime!"
end

time_of_day(daylight)