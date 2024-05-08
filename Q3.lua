--My Implementation
--Looks like this function is supposed to remove a member from a players party
function removeMemberFromPlayerParty(playerId, membername) --Takes playerId to get party and member name of person to remove
player = Player(playerId) --Create player from player id
local party = player:getParty() --Get players party, table of all members

for k,v in pairs(party:getMembers()) do --Loop through all members
if v == Player(membername) then --If player from table is player passed in to function
party:removeMember(Player(membername)) --Remove player from the party
end --End if
end --End for loop on table
end --End 