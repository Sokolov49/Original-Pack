if string.lower(RequiredScript) == "lib/units/enemies/cop/copdamage" then
	if SystemFS:exists("mods/Enemy Visor Shattering") then
		return
	else
		local ids_func = Idstring
		local table_contains = table.contains

		local big_idstring_table = {
			ids_func("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
			ids_func("units/payday2/characters/ene_tazer_1/ene_tazer_1_husk"), 		
			ids_func("units/payday2/characters/ene_shield_2/ene_shield_2"),
			ids_func("units/payday2/characters/ene_shield_2/ene_shield_2_husk"),
			ids_func("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"),
			ids_func("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1_husk")
		}	

		local enemies_plink = {
			ids_func("units/payday2/characters/ene_swat_1/ene_swat_1"),
			ids_func("units/payday2/characters/ene_swat_1/ene_swat_1_husk"),
			ids_func("units/payday2/characters/ene_swat_2/ene_swat_2"),
			ids_func("units/payday2/characters/ene_swat_2/ene_swat_2_husk"),
			ids_func("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
			ids_func("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1_husk"),
			ids_func("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
			ids_func("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2_husk"),
			ids_func("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"),
			ids_func("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1_husk"),
			ids_func("units/payday2/characters/ene_shield_1/ene_shield_1"),
			ids_func("units/payday2/characters/ene_shield_1/ene_shield_1_husk"), 
			ids_func("units/payday2/characters/ene_city_swat_1/ene_city_swat_1"),
			ids_func("units/payday2/characters/ene_city_swat_1/ene_city_swat_1_husk"),
			ids_func("units/payday2/characters/ene_city_swat_2/ene_city_swat_2"),
			ids_func("units/payday2/characters/ene_city_swat_2/ene_city_swat_2_husk"),
			ids_func("units/payday2/characters/ene_city_swat_3/ene_city_swat_3"),
			ids_func("units/payday2/characters/ene_city_swat_3/ene_city_swat_3_husk"),
			ids_func("units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"),
			ids_func("units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat_husk")
		}

		Hooks:PreHook( CopDamage, "_spawn_head_gadget", "smash_generics", function(self, params)
			if not self._head_gear then
				return
			end

			if self._head_gear_object then
				if self._nr_head_gear_objects then
					for i = 1, self._nr_head_gear_objects do
						local head_gear_obj_name = self._head_gear_object .. tostring(i)

						self._unit:get_object(Idstring(head_gear_obj_name)):set_visibility(false)
					end
				else
					self._unit:get_object(Idstring(self._head_gear_object)):set_visibility(false)
				end

				if self._head_gear_decal_mesh then
					local mesh_name_idstr = Idstring(self._head_gear_decal_mesh)

					self._unit:decal_surface(mesh_name_idstr):set_mesh_material(mesh_name_idstr, Idstring("flesh"))
				end
			end

			local my_unit = self._unit

			local smashablefuckers = table_contains(big_idstring_table, my_unit:name())
			local metalplink = table_contains(enemies_plink, my_unit:name())
			
			local head_obj = ids_func("Head")
			local head_object_get = my_unit:get_object(head_obj)
			
			if not head_object_get then
				return
			end
			
			local world_g = World		
			local sound_ext = my_unit:sound()	

			if smashablefuckers then
				world_g:effect_manager():spawn({
					effect = ids_func("effects/particles/bullet_hit/glass_breakable/bullet_hit_glass_breakable"),
					parent = head_object_get		
				})			
				world_g:effect_manager():spawn({
					effect = ids_func("effects/payday2/particles/impacts/glass_impact_pd2"),
					parent = head_object_get		
				})
				world_g:effect_manager():spawn({
					effect = ids_func("effects/particles/bullet_hit/sheet_metal/bullet_hit_sheet_metal"),
					parent = head_object_get		
				})
				world_g:effect_manager():spawn({
					effect = ids_func("effects/payday2/particles/impacts/saw_metal_impact_pd2"),
					parent = head_object_get		
				})
				world_g:effect_manager():spawn({
					effect = ids_func("effects/payday2/particles/impacts/blood/blood_light_red"),
					parent = head_object_get		
				})
				world_g:effect_manager():spawn({
					effect = ids_func("effects/particles/bullet_hit/flesh/bullet_impact_flesh_01"),
					parent = head_object_get		
				})
				sound_ext:play("swat_heavy_visor_shatter", nil, nil)
				sound_ext:play("swat_heavy_visor_shatter", nil, nil)
				sound_ext:play("swat_heavy_visor_shatter", nil, nil)
				
			elseif metalplink then
				world_g:effect_manager():spawn({
					effect = ids_func("effects/particles/bullet_hit/sheet_metal/bullet_hit_sheet_metal"),
					parent = head_object_get		
				})
				world_g:effect_manager():spawn({
					effect = ids_func("effects/payday2/particles/impacts/blood/blood_light_red"),
					parent = head_object_get		
				})
				world_g:effect_manager():spawn({
					effect = ids_func("effects/payday2/particles/impacts/saw_metal_impact_pd2"),
					parent = head_object_get		
				})
				world_g:effect_manager():spawn({
					effect = ids_func("effects/particles/bullet_hit/flesh/bullet_impact_flesh_01"),
					parent = head_object_get		
				})
				sound_ext:play("swatturret_weakspot_hit", nil, nil)
			end
		end)
	end
end
if string.lower(RequiredScript) == "lib/tweak_data/charactertweakdata" then
	Hooks:PostHook( CharacterTweakData, "init", "death_noises", function(self)
			self.sniper.die_sound_event = "mga_death_scream"
			self.swat.die_sound_event = "shd_x02a_any_3p_01"
			self.heavy_swat.die_sound_event = "bdz_x02a_any_3p"
			self.fbi_swat.die_sound_event = "shd_x02a_any_3p_01"
			self.fbi_heavy_swat.die_sound_event = "bdz_x02a_any_3p"
			self.city_swat.die_sound_event = "shd_x02a_any_3p_01"
			self.zeal_swat.die_sound_event = "shd_x02a_any_3p_01"
			
			--variety
			self.russian.weapon.weapons_of_choice = {
				primary = "wpn_fps_ass_akm_npc",
				secondary = Idstring("units/payday2/weapons/wpn_npc_beretta92/wpn_npc_beretta92")
			}
			self.american.weapon.weapons_of_choice = {
				primary = "wpn_fps_ass_akm_npc",
				secondary = Idstring("units/payday2/weapons/wpn_npc_c45/wpn_npc_c45")
			}
			self.old_hoxton.weapon.weapons_of_choice = {
				primary = "wpn_fps_ass_akm_npc",
				secondary = Idstring("units/payday2/weapons/wpn_npc_mac11/wpn_npc_mac11")
			}
			self.jacket.weapon.weapons_of_choice = {
				primary = "wpn_fps_ass_akm_npc",
				secondary = Idstring("units/payday2/weapons/wpn_npc_c45/wpn_npc_c45")
			}
			self.sokol.weapon.weapons_of_choice = {
				primary = "wpn_fps_ass_akm_npc",
				secondary = Idstring("units/payday2/weapons/wpn_npc_mac11/wpn_npc_mac11")
			}
			self.joy.weapon.weapons_of_choice = {
				primary = "wpn_fps_smg_mp5_npc",
				secondary = Idstring("units/payday2/weapons/wpn_npc_mac11/wpn_npc_mac11")
			}
	end)
end
if string.lower(RequiredScript) == "lib/managers/hudmanagerpd2" then
	function HUDManager:temp_show_carry_bag( carry_id, value )
		self._hud_temp:show_carry_bag( carry_id, value )
		self._sound_source:post_event( "Play_bag_generic_pickup" )
	end

	function HUDManager:temp_hide_carry_bag()
		self._hud_temp:hide_carry_bag()
		self._sound_source:post_event( "Play_bag_generic_throw" )
	end
end
if string.lower(RequiredScript) == "lib/tweakdata/weapontweakdata" then
	Hooks:PostHook(WeaponTweakData, "init", "particles_init", function(self)
		self.r870_npc.muzzleflash = "effects/payday2/particles/weapons/shotgun/resmod1"
		self.saiga_npc.muzzleflash = "effects/payday2/particles/weapons/shotgun/resmod1"
		self.benelli_npc.muzzleflash = "effects/payday2/particles/weapons/shotgun/resmod1"

		self.deagle.muzzleflash = "effects/payday2/particles/weapons/50cal_auto_fps"
		self.m60.muzzleflash = "effects/payday2/particles/weapons/50cal_auto_fps"
		self.hk21.muzzleflash = "effects/payday2/particles/weapons/50cal_auto_fps"
		
		self.new_raging_bull.muzzleflash = "effects/payday2/particles/weapons/357_effect_fps"
		self.chinchilla.muzzleflash = "effects/payday2/particles/weapons/357_effect_fps"
		
		self.winchester1874.muzzleflash = "effects/payday2/particles/weapons/308_muzzle"
		self.wa2000.muzzleflash = "effects/payday2/particles/weapons/308_muzzle"
		
		--primaries
		self.r870.muzzleflash = "effects/payday2/particles/weapons/shotgun/resmod2"
		self.boot.muzzleflash = "effects/payday2/particles/weapons/shotgun/resmod2"
		self.saiga.muzzleflash = "effects/payday2/particles/weapons/shotgun/resmod2"
		self.b682.muzzleflash = "effects/payday2/particles/weapons/shotgun/resmod2"
		self.benelli.muzzleflash = "effects/payday2/particles/weapons/shotgun/resmod2"
		self.huntsman.muzzleflash = "effects/payday2/particles/weapons/shotgun/resmod2"
		self.spas12.muzzleflash = "effects/payday2/particles/weapons/shotgun/resmod2"
		self.ksg.muzzleflash = "effects/payday2/particles/weapons/shotgun/resmod2"
		self.aa12.muzzleflash = "effects/payday2/particles/weapons/shotgun/resmod2"
		self.m189.muzzleflash = "effects/payday2/particles/weapons/shotgun/resmod2"
		self.m590.muzzleflash = "effects/payday2/particles/weapons/shotgun/resmod2"
		self.sko12.muzzleflash = "effects/payday2/particles/weapons/shotgun/resmod2"
		self.supernova.muzzleflash = "effects/payday2/particles/weapons/shotgun/resmod2"
		
		--secondaries
		self.basset.muzzleflash = "effects/payday2/particles/weapons/shotgun/resmod2"
		self.m37.muzzleflash = "effects/payday2/particles/weapons/shotgun/resmod2"
		self.rota.muzzleflash = "effects/payday2/particles/weapons/shotgun/resmod2"
		self.serbu.muzzleflash = "effects/payday2/particles/weapons/shotgun/resmod2"
		self.striker.muzzleflash = "effects/payday2/particles/weapons/shotgun/resmod2"
		self.judge.muzzleflash = "effects/payday2/particles/weapons/shotgun/resmod2"
		self.coach.muzzleflash = "effects/payday2/particles/weapons/shotgun/resmod2"
		self.ultima.muzzleflash = "effects/payday2/particles/weapons/shotgun/resmod2"
		
		--make the akm and m4 match, slightly buff mp5
		self.mp5_crew.DAMAGE = 1.25
		self.akm_crew.DAMAGE = 1.5
		self.m4_crew.DAMAGE = 1.5
	end)
end
if string.lower(RequiredScript) == "lib/units/beings/player/playerdamage" then
	--make the downed state more dramatic
	function PlayerDamage:update_downed(t, dt)
		if self._downed_timer and self._downed_paused_counter == 0 then
			self._downed_timer = self._downed_timer - dt

			if self._downed_start_time == 0 then
				self._downed_progression = 100
			else
				self._downed_progression = math.clamp(1 - self._downed_timer / self._downed_start_time, 0, 1) * 100
			end

			if not _G.IS_VR then
				managers.environment_controller:set_downed_value(self._downed_progression + 45)
			end

			SoundDevice:set_rtpc("downed_state_progression", self._downed_progression + 25)

			return self._downed_timer <= 0
		end

		return false
	end
end
if string.lower(RequiredScript) == "lib/units/beings/player/playerstandard" then
	local function set_hos(self)
		self._ext_network:send("set_stance", 2, false, false)
	end

	Hooks:PostHook(PlayerStandard, "_enter", "_enter_hos", set_hos)
	Hooks:PostHook(PlayerStandard, "_end_action_steelsight", "_end_action_steelsight_hos", set_hos)
	Hooks:PostHook(PlayerStandard, "set_running", "set_running_hos", set_hos)
end
if string.lower(RequiredScript) == "lib/units/beings/player/huskplayerinventory" then
	function HuskPlayerInventory:synch_weapon_gadget_state(state)
		if self:equipped_unit():base().set_gadget_on and self._unit:movement().set_cbt_permanent 	then
			self:equipped_unit():base():set_gadget_on(state, true)
		end
	end
end
if string.lower(RequiredScript) == "lib/units/beings/player/huskplayermovement" then
	function HuskPlayerMovement:set_cbt_permanent(on)
	end

	function HuskPlayerMovement:_chk_change_stance()
		local wanted_stance_code = nil

		if self.clean_states[self._state] then
			wanted_stance_code = self._stance.owner_stance_code
		elseif self._aim_up_expire_t then
			wanted_stance_code = 3
		else
			wanted_stance_code = self._stance.owner_stance_code
		end

		if wanted_stance_code ~= self._stance.code then
			self:_change_stance(wanted_stance_code)
		end
	end
end
if string.lower(RequiredScript) == "lib/tweak_data/timespeedeffecttweakdata" then
	function TimeSpeedEffectTweakData:_init_base_effects()
		self.mask_on = {
			sustain = 0,
			timer = "pausable",
			speed = 0,
			fade_out = 0,
			fade_in = 0,
			fade_in_delay = 0
		}
		self.mask_on_player = {
			speed = 0,
			affect_timer = "player",
			fade_in_delay = self.mask_on.fade_in_delay,
			fade_in = self.mask_on.fade_in,
			sustain = self.mask_on.sustain,
			fade_out = self.mask_on.fade_out,
			timer = self.mask_on.timer
		}
		self.downed = {
			sustain = 0,
			timer = "pausable",
			speed = 0,
			fade_in = 0,
			fade_out = 0
		}
		self.downed_player = {
			affect_timer = "player",
			speed = self.downed.speed,
			fade_in = self.downed.fade_in,
			sustain = self.downed.sustain,
			fade_out = self.downed.fade_out,
			timer = self.downed.timer
		}
	end
	
	function TimeSpeedEffectTweakData:_init_mission_effects()
		self.mission_effects = {quickdraw = {
			sustain = 0,
			timer = "pausable",
			speed = 0,
			fade_out = 0,
			fade_in = 0,
			sync = true,
			fade_in_delay = 0
		}}
		self.mission_effects.quickdraw_player = {
			timer = "pausable",
			speed = 0,
			affect_timer = "player",
			sync = true,
			fade_in_delay = self.mission_effects.quickdraw.fade_in_delay,
			fade_in = self.mission_effects.quickdraw.fade_in,
			sustain = self.mission_effects.quickdraw.sustain,
			fade_out = self.mission_effects.quickdraw.fade_out
		}
	end
end
if string.lower(RequiredScript) == "lib/units/beings/player/states/playertased" then
--this likely wont work but its worth a try
--i probably shouldn't copy entire functions
	function PlayerTased:_start_action_tased(t, non_lethal)
		self:_interupt_action_running(t)
		self:_stance_entered()
		self:_update_crosshair_offset()
		self._unit:camera():play_redirect(self:get_animation("tased"))
		self._unit:sound():play("tasered_loop")
		managers.hint:show_hint(non_lethal and "hint_been_electrocuted" or "hint_been_tasered")
		managers.environment_controller:set_downed_value(50)
	end
	
	function PlayerTased:exit(state_data, enter_data)
		PlayerTased.super.exit(self, state_data, enter_data)

		if self._fatal_delayed_clbk then
			managers.enemy:remove_delayed_clbk(self._fatal_delayed_clbk)

			self._fatal_delayed_clbk = nil
		end

		if self._recover_delayed_clbk then
			managers.enemy:remove_delayed_clbk(self._recover_delayed_clbk)

			self._recover_delayed_clbk = nil
		end

		if Network:is_server() and self._SO_id then
			managers.groupai:state():remove_special_objective(self._SO_id)
		end

		managers.environment_controller:set_taser_value(1)
		self._camera_unit:base():break_recoil()
		self._unit:sound():play("tasered_stop")
		managers.rumble:stop(self._rumble_electrified)
		self._unit:camera():play_redirect(Idstring("idle"))

		self._tase_ended = nil
		self._counter_taser_unit = nil
		self._num_shocks = nil
		self.tased = false
		self._state_data.non_lethal_electrocution = nil

		if managers.player:has_category_upgrade("player", "escape_taser") then
			managers.hud:remove_interact()
		end

		managers.environment_controller:set_downed_value(0)
		
		managers.player:unregister_message(Message.SendTaserMalfunction, "taser_malfunction")
		managers.player:unregister_message(Message.EscapeTase, "escape_tase")
		CopDamage.unregister_listener("on_criminal_tased")
	end

	function PlayerTased:_check_action_shock(t, input)
		self._next_shock = self._next_shock or 0.5

		if self._next_shock < t then
			self._num_shocks = self._num_shocks or 0
			self._num_shocks = self._num_shocks + 1
			self._next_shock = t + 0.1 + math.rand(0.5)
			self._unit:camera():play_shaker("player_taser_shock", 1, 10)
			self._unit:camera():camera_unit():base():set_target_tilt((math.random(2) == 1 and -1 or 1) * math.random(25))

			self._taser_value = self._taser_value or 1
			self._taser_value = math.max(self._taser_value - 0.25, 0)

			self._unit:sound():play("tasered_shock")
			managers.rumble:play("electric_shock")

			if not alive(self._counter_taser_unit) then
				self._camera_unit:base():start_shooting()

				self._recoil_t = t + 0.25

				if not managers.player:has_category_upgrade("player", "resist_firing_tased") then
					input.btn_primary_attack_state = true
					input.btn_primary_attack_press = true
				end

				self._camera_unit:base():recoil_kick(-15, 15, -15, 15)
				self._unit:camera():play_redirect(self:get_animation("tased_boost"))
			end
		elseif self._recoil_t then
			if not managers.player:has_category_upgrade("player", "resist_firing_tased") then
				input.btn_primary_attack_state = true
			end

			if self._recoil_t < t then
				self._recoil_t = nil

				self._camera_unit:base():stop_shooting()
			end
		end
	end
	
	function PlayerTased:_update_check_actions(t, dt)
		local input = self:_get_input(t, dt)

		self:_check_action_shock(t, input)

		self._taser_value = math.step(self._taser_value, 0.8, dt / 4)

		managers.environment_controller:set_taser_value(self._taser_value)

		local shooting = self:_check_action_primary_attack(t, input)

		if shooting then
			self._camera_unit:base():recoil_kick(-15, 15, -15, 15)
		end

		if self._unequip_weapon_expire_t and self._unequip_weapon_expire_t <= t then
			self._unequip_weapon_expire_t = nil

			self:_start_action_equip_weapon(t)
		end

		if self._equip_weapon_expire_t and self._equip_weapon_expire_t <= t then
			self._equip_weapon_expire_t = nil
		end

		if input.btn_stats_screen_press then
			self._unit:base():set_stats_screen_visible(true)
		elseif input.btn_stats_screen_release then
			self._unit:base():set_stats_screen_visible(false)
		end

		self:_update_foley(t, input)

		local new_action = nil

		self:_check_action_interact(t, input)

		local new_action = nil
	end
end