--My Implementation

function printSmallGuildNames(memberCount)
-- this method is supposed to print names of all guilds that have less than memberCount max members
local selectGuildQuery = "SELECT name FROM guilds WHERE max_members < %d;" --SQL query to select names of guilds from guilds table, where condition looks good
local resultId = db.storeQuery(string.format(selectGuildQuery, memberCount)) --Send query to database, replacing %d with passed member count
for k, v in pairs(result) do --Could be multiple guilds returned, so loop through everything in returned table
	local guildName = v.getString("name") --Extract name from returned guild data
	print(guildName) --Print guild name
end --End function