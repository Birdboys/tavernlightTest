--My Implementation

-- This code looks fine to me
-- Without knowing explicitly why we use the 1000 ms timer on addEvent to call releaseStorage, I don't want to get rid of that functionality
local function releaseStorage(player) --Sets passed players storage value at index 1000 to -1, the value for empty storage
player:setStorageValue(1000, -1) --Setting storage value
end --End

function onLogout(player) --When player logs out
if player:getStorageValue(1000) == 1 then --If they have a 1 stored in the 1000 slot
addEvent(releaseStorage, 1000 player) --Reset player's 1000 storage to empty
end --End if
return true --Return true so player is successfully logged out
end