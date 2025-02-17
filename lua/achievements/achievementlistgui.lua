local data = AchievementListItem.init
function AchievementListItem:init(...)
	data(self, ...)
	local id = self._data.key
	local info = self._data.info
	self._info = info or {}
	local awarded = self._info.awarded
	if awarded then
		managers.achievment:track(id, false)
		managers.achievment:force_track(id, false)
		self._highlight:set_visible(self._info.forced)
	end
end
