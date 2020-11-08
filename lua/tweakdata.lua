local self = tweak_data

self.version = "1.3.5"
self.testing_text = ''

self.hate_multipler = 1.5
self.bullet_hit_alert_radius = 300
self.footstep_alert_radius = 450
self.neighbours_alert_radius_trigger = 2500
self.neighbours_trigger_delay = math.random(3, 7)
self.drill_investigate_zone_multipler = 1.25 							-- чем больше радиус проверки, тем меньше радиус шума

local pro_rank = 5
self.unlock_safehouse = pro_rank
self.unlock_crimespree = pro_rank
self.unlock_skirmish = pro_rank
self.unlock_profiles = pro_rank

self.max_offshore = 1000000000
self.max_spending_cash = 150000000
self.max_coins = 250000

self.killed_civs_penalty = {1, 2, 3}
self.easy_mode_exp_penalty = 50 --%
self.max_loose_money_boost = 30 --%
self.loose_money_exp_convertation_amount = 30000

self.quickplay.default_level_diff = {0, 100}
self.quickplay.max_level_diff = {100, 100}

self.difficulty_level_locks = 					{0, 0, 0, 0, 0, 80, 1337, 1337}
self.difficulty_level_locks_infamy = 			{0, 0, 0, 0, 0, 0, 1337, 1337}

self.screen_colors.max_money = Color(255, 121, 227, 177) / 255
self.screen_colors.one_down = Color(255, 176, 230, 239) / 255

self.difficulties = {
	"easy",
	"normal",
	"hard",
	"overkill",
	"overkill_145",
	"overkill_290",
	"sm_wish",
	"sm_wish"
}
self.experience_manager.difficulty_multiplier = {2, 5, 10, 13, 18, 18}
self.experience_manager.loot_drop_value.xp10 = 130000
self.experience_manager.loot_drop_value.xp20 = 150000
self.experience_manager.loot_drop_value.xp30 = 170000
self.experience_manager.loot_drop_value.xp40 = 200000
self.experience_manager.loot_drop_value.xp50 = 230000
self.experience_manager.loot_drop_value.xp60 = 260000
self.experience_manager.loot_drop_value.xp70 = 300000
self.experience_manager.loot_drop_value.xp80 = 350000
self.experience_manager.loot_drop_value.xp90 = 390000
self.experience_manager.loot_drop_value.xp100 = 430000