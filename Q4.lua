--My Implementation
void Game::addItemToPlayer(const std::string& recipient, uint16_t itemId)
{
	Player* player = g_game.getPlayerByName(recipient); --Create player pointer pointing to playe returned by getPlayerByName() function
	if (!player) { --If we don't have a player
		player = new Player(nullptr); --Create a new player to point at
		if (!IOLoginData::loadPlayerByName(player, recipient)) { --If we are unable to load the player by name
			player = nil --Set player up for garbage collection
			return; --Return, no player to add item to
		}
	}

	Item* item = Item::CreateItem(itemId); --Create item pointer to newly created item with itemId
	if (!item) { --If item is nil, item wasn't created, already set up for garbage collection
	return; --Return, no item to add to player
	}

	g_game.internalAddItem(player->getInbox(), item, INDEX_WHEREEVER, FLAG_NOLIMIT); --Add the item to the player

	if (player->isOffline()) { --If player is offline
	IOLoginData::savePlayer(player); --Save player data
	}
	player = nil --Set player pointer up for garbage collection
	item = nil --Set item up for garbage collection
}
