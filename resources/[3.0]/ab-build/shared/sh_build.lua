Build = {}
Build.func = {}

function getModule(module)
    if not Build then print("Warning: '" .. tostring(module) .. "' module doesn't exist") return false end
    return Build[module]
end

Build.Plans = {

	["v_int_49"] = {
		["shell"] = "v_49_motelmp_shell",
		["saveClient"] = true,
		["origin"] = vector3(152.7,-1005.07,-98.99),
		["generator"] = vector3(175.09986877441,-904.7946166992,-98.9),
		["spawnOffset"] = vector3(-0.49,-1.76,1.01),
		["bedOffset"] = vector4(1.82,-0.66,1.59,88.27),
		["modulo"] = {
			["multi"] = {
				x = 12.0,
				y = 12.0,
				z = -14.0,
			},
			["xLimit"] = 24,
			["yLimit"] = 2,
		},
		["interact"] = {
			[1] = {
				
				["offset"] = vector3(-1.04,3.4,1.20),
				["viewDist"] = 2.0,
				["useDist"] = 2.0,
				["generalUse"] = {"",""},
				["housingMain"] = {"",""},
				["housingSecondary"] = {"to swap char or ~g~/outfits~s~.","apartments:Logout"},
			},
			[2] = {
				
				["offset"] = vector3(-0.96,-3.59,1.20),
				["viewDist"] = 2.0,
				["useDist"] = 2.0,
				["generalUse"] = {"",""},
				["housingMain"] = {"to leave.","apartments:leave"},
				["housingSecondary"] = {"",""},
			},
			[3] = {
				
				["offset"] = vector3(-1.6,1.2,1.0),
				["viewDist"] = 2.0,
				["useDist"] = 2.0,
				["generalUse"] = {"",""},
				["housingMain"] = {"to interact.","apartments:stash"},
				["housingSecondary"] = {"",""},
			}
		},
		["peek"] = {
			["model"] = -1388847408,
			["event"] = "ab-housing:alarmEnter",
			["id"] = "ab-housing:alarmEnter",
			["icon"] = "hammer",
			["label"] = "Disable",
			["distance"] = {radius = 2.0}
		} 
	},

	["np_apartments_room"] = {
		["shell"] = "gabz_pinkcage_ymap_shell",
		["saveClient"] = true,
		["origin"] = vector3(0.0,0.0,0.0),
		["generator"] = vector3(-334.32,-953.21,-98.9),
		["spawnOffset"] = vector3(-3.88,-2.97,-1.28),
		["bedOffset"] = vector4(-3.46,0.56,-0.32,99.6),
		["modulo"] = {
			["multi"] = {
				x = 12.0,
				y = 12.0,
				z = -14.0,
			},
			["xLimit"] = 24,
			["yLimit"] = 2,
		},
		["interact"] = {
			[1] = {
				
				["offset"] = vector3(-0.18,2.75,-0.78),
				["viewDist"] = 2.0,
				["useDist"] = 2.0,
				["generalUse"] = {"",""},
				["housingMain"] = {"",""},
				["housingSecondary"] = {"to swap char or ~g~/outfits~s~.","apartments:Logout"},
			},
			[2] = {
				
				["offset"] = vector3(-4.03,-3.62,-0.78),
				["viewDist"] = 2.0,
				["useDist"] = 2.0,
				["generalUse"] = {"",""},
				["housingMain"] = {"to leave.","apartments:leave"},
				["housingSecondary"] = {"",""},
			},
			[3] = {
				
				["offset"] = vector3(0.97,-2.15,-0.75),
				["viewDist"] = 2.0,
				["useDist"] = 2.0,
				["generalUse"] = {"",""},
				["housingMain"] = {"to interact.","apartments:stash"},
				["housingSecondary"] = {"",""},
			}
		}
	},

	["v_int_16_mid"] = {
		["shell"] = "v_16_mid_shell",
		["saveClient"] = true,
		["origin"] = vector3(347.04724121094,-1000.2844848633,-99.194671630859),
		["generator"] = vector3(175.09986877441,-904.7946166992,-98.999984741211),
		["spawnOffset"] = vector3(4.5,-14.0,0.7),
		["backSpawnOffset"] = vector3(-3.8,5.2,0.7),
		["bedOffset"] = vector4(7.18,1.43,1.47,271.37),
		["offsetX"] = {
			["num"] = 175.09986877441,
			["multi"] = 25.0
		},
		["offsetY"] = {
			["num"] = -774.7946166992,
			["multi"] = 0.0
		},
		["offsetZ"] = {
			["num"] = 0.0,
			["multi"] = 0.0
		},
		["interact"] = {
			[1] = {
				["offset"] = vector3(8.0,4.0,1.1),
				["viewDist"] = 2.0,
				["useDist"] = 2.0,
				["generalUse"] = {"",""},
				["housingMain"] = {"",""},
				["housingSecondary"] = {"to swap char or ~g~/outfits~s~.","apartments:Logout"},
			},
			[2] = {
				["offset"] = vector3(4.3,-15.95,0.95),
				["viewDist"] = 2.0,
				["useDist"] = 2.0,
				["generalUse"] = {"",""},
				["housingMain"] = {"to leave.","apartments:leave"},
				["housingSecondary"] = {"",""},
			},
			[3] = {
				["offset"] = vector3(9.8,-1.35,0.15),
				["viewDist"] = 2.0,
				["useDist"] = 2.0,
				["generalUse"] = {"",""},
				["housingMain"] = {"to interact.","apartments:stash"},
				["housingSecondary"] = {"",""},
			}
		},
		["peek"] = {
			["model"] = -1388847408,
			["event"] = "ab-housing:alarmEnter",
			["id"] = "ab-housing:alarmEnter",
			["icon"] = "hammer",
			["label"] = "Disable",
			["distance"] = {radius = 2.0}
		} 
	},


	


	["v_int_16_high"] = {
		["shell"] = "playerhouse_tier3",
		["saveClient"] = true,
		["origin"] = vector3(305.66970825195,-993.61737060547,-94.195129394531),
		["generator"] = vector3(-265.68209838867,-957.06573486328,145.824577331543),
		["spawnOffset"] = vector3(-12.9,-1.5,8.0),
		["bedOffset"] = vector4(4.57,-1.19,1.73,90.47),
		["customLocations"] = {
			[1] = {
				["gen"] = vector3(131.0290527343,-644.0509033203,68.025619506836),
				["offSet"] = vector3(0.0,0.0,68.0534912),
				["numMulStart"] = 0,
				["numMulEnd"] = 7,
				["multi"] = 11.0,
			},

			[2] = {
				["gen"] = vector3(131.0290527343,-644.0509033203,91.025619506836),
				["offSet"] = vector3(0.0,0.0,61.9534912),
				["numMulStart"] = 6,
				["numMulEnd"] = 14,
				["multi"] = 11.0,
			},

			[3] = {
				["gen"] = vector3(131.0290527343,-644.0509033203,115.025619506836),
				["offSet"] = vector3(0.0,0.0,61.9534912),
				["numMulStart"] = 13,
				["numMulEnd"] = 20,
				["multi"] = 11.0,
			},

			[4] = {
				["gen"] = vector3(131.0290527343,-644.0509033203,170.025619506836),
				["offSet"] = vector3(0.0,0.0,61.9534912),
				["numMulStart"] = 19,
				["numMulEnd"] = 26,
				["multi"] = 11.0,
			},

			[5] = {
				["gen"] = vector3(-3.9463002681732,-693.2456665039,103.0334701538),
				["offSet"] = vector3(0.0,0.0,103.0534912),
				["numMulStart"] = 25,
				["numMulEnd"] = 38,
				["multi"] = 11.0,
			},

			[6] = {
				["gen"] = vector3(140.0758819580,-748.12322998, 87.0334701538),
				["offSet"] = vector3(0.0,0.0,87.0534912),
				["numMulStart"] = 37,
				["numMulEnd"] = 49,
				["multi"] = 11.0,
			},

			[7] = {
				["gen"] = vector3(-3.9463002681732,-693.2456665039,160.0334701538),
				["offSet"] = vector3(0.0,0.0,68.0534912),
				["numMulStart"] = 48,
				["numMulEnd"] = 60,
				["multi"] = 11.0,
			},
		},
		["interact"] = {
			[1] = {
				
				["offset"] = vector3(6.0,6.0,1.5),
				["viewDist"] = 2.0,
				["useDist"] = 2.0,
				["generalUse"] = {"",""},
				["housingMain"] = {"",""},
				["housingSecondary"] = {"to swap char or ~g~/outfits~s~.","apartments:Logout"}, 
			},
			[2] = {
				
				["offset"] = vector3(-14.45,-2.5,7.3),
				["viewDist"] = 2.0,
				["useDist"] = 2.0,
				["generalUse"] = {"",""},
				["housingMain"] = {"to leave ","apartments:leave"},
				["housingSecondary"] = {"",""},
				--["housingSecondary"] = {"to enter garage.","apartments:garage"},
			},
			[3] = {
				
				["offset"] = vector3(1.5,8.0,1.0),
				["viewDist"] = 2.0,
				["useDist"] = 2.0,
				["generalUse"] = {"",""},
				["housingMain"] = {"to interact.","apartments:stash"},
				["housingSecondary"] = {"",""},
			}
		}
	},

	["v_int_72_l"] = {
		["shell"] = "v_72_garagel_shell",
		["saveClient"] = true,
		["origin"] = vector3(228.54,-999.84,-98.99),
		["generator"] = vector3(227.391,-1035.0,-98.99),
		["spawnOffset"] = vector3(9.5,-12.7,2.0),
		["offsetX"] = {
			["num"] = 175.09986877441,
			["multi"] = 25.0
		},
		["offsetY"] = {
			["num"] = -774.7946166992,
			["multi"] = 0.0
		},
		["offsetZ"] = {
			["num"] = 0.0,
			["multi"] = 0.0
		},
		["interact"] = {
			[1] = {
				["offset"] = vector3(9.5,-12.7,1.0),
				["viewDist"] = 2.0,
				["useDist"] = 2.0,
				["generalUse"] = {"",""},
				["housingMain"] = {"to Room","apartments:garageToHouse"},
				["housingSecondary"] = {"to Garage Door.","apartments:garageToWorld"}, 
			},
		}
	},

	["v_int_44"] = {
		["shell"] = "v_44_shell",
		["saveClient"] = false,
		["origin"] = vector3(-801.5,178.69,72.84),
		["generator"] = vector3(-811.5,178.69,-40.84),
		["spawnOffset"] = vector3(-5.5793,5.100,0.0),
		["backSpawnOffset"] = vector3(14.17921200,1.90079500,1.1),
		["offsetX"] = {
			["num"] = -811.5,
			["multi"] = 26.0
		},
		["offsetY"] = {
			["num"] = 0.0,
			["multi"] = 0.0
		},
		["offsetZ"] = {
			["num"] = 0.0,
			["multi"] = 0.0
		},
		["interact"] = {
			[1] = {
				["offset"] = vector3(-6.9,6.32,1.01),
				["viewDist"] = 2.0,
				["useDist"] = 2.0,
				["generalUse"] = {"",""},
				["housingMain"] = {"to leave.","housing:frontdoor"},
				["housingSecondary"] = {"",""},
			},
		},
		["peek"] = {
			["model"] = -1388847408,
			["event"] = "ab-housing:alarmEnter",
			["id"] = "ab-housing:alarmEnter",
			["icon"] = "hammer",
			["label"] = "Disable",
			["distance"] = {radius = 2.0}
		} 
	},

	["ex_int_office_03b_dlc"] = {
		["shell"] = "ex_office_03b_shell",
		["saveClient"] = false,
		["origin"] = vector3(-139.53950000,-629.07570000,167.82040000),
		["generator"] = vector3(162.78,-21.89,-44.35),
		["spawnOffset"] = vector3(-3.5793,3.100,0.0),
		["offsetX"] = {
			["num"] = -811.5,
			["multi"] = 26.0
		},
		["offsetY"] = {
			["num"] = 0.0,
			["multi"] = 0.0
		},
		["offsetZ"] = {
			["num"] = 0.0,
			["multi"] = 0.0
		},
		["interact"] = {
			[1] = {
				["offset"] = vector3(-4.73,3.11,1.02),
				["viewDist"] = 2.0,
				["useDist"] = 2.0,
				["generalUse"] = {"",""},
				["housingMain"] = {"to leave.","housing:frontdoor"},
				["housingSecondary"] = {"",""},
			},
		},
	},

	-- Empty Buildings 

	["v_int_38"] = {
		["shell"] = "v_38_c_barbers_shell",
		["saveClient"] = false,
		["origin"] = vector3(1212.77,-472.43,66.21),
		["spawnOffset"] = vector3(-1.4,-4.47,0.0),
		["interact"] = {
			[1] = {
				["offset"] = vector3(-0.89,-4.52,1.0),
				["viewDist"] = 2.0,
				["useDist"] = 2.0,
				["generalUse"] = {"",""},
				["housingMain"] = {"to leave.","housing:frontdoor"},
				["housingSecondary"] = {"",""},
			},
		},
	},

	["bkr_biker_dlc_int_ware05"] = {
		["shell"] = "bkr_ware06_walls_upgrade",
		["saveClient"] = false,
		["origin"] = vector3(1165.09,-3191.71,-39.0),
		["spawnOffset"] = vector3(5.81353500,0.28204400,0.0),
		["interact"] = {
			[1] = {
				["offset"] = vector3(8.69,0.0,1.03),
				["viewDist"] = 2.0,
				["useDist"] = 2.0,
				["generalUse"] = {"",""},
				["housingMain"] = {"to leave.","housing:frontdoor"},
				["housingSecondary"] = {"",""},
			},
		},
	},

	["v_int_16_low"] = {
		["shell"] = "V_16_Studio_LoShell",
		["saveClient"] = false,
		["origin"] = vector3(260.32970000 ,-997.42880000, -100.00000000),
		["spawnOffset"] = vector3(5.3,-5.5,1.2),
		["interact"] = {
			[1] = {
				["offset"] = vector3(5.65,-10.03,-0.99),
				["viewDist"] = 2.0,
				["useDist"] = 2.0,
				["generalUse"] = {"",""},
				["housingMain"] = {"to leave.","housing:frontdoor"},
				["housingSecondary"] = {"",""},
			},
		},
	},

	["v_int_24"] = {
		["shell"] = "V_24_Shell",
		["saveClient"] = false,
		["origin"] = vector3(3.19946300 ,529.78070000, 169.62620000),
		["spawnOffset"] = vector3(7.5793,6.400,7.0),
		["interact"] = {
			[1] = {
				["offset"] = vector3(8.05,6.18,6.41),
				["viewDist"] = 2.0,
				["useDist"] = 2.0,
				["generalUse"] = {"",""},
				["housingMain"] = {"to leave.","housing:frontdoor"},
				["housingSecondary"] = {"",""},
			},
		},
	},
	
	["v_int_24_full"] = {
		["shell"] = "V_24_Shell_full",
		["saveClient"] = false,
		["origin"] = vector3(3.19946300 ,529.78070000, 169.62620000),
		["spawnOffset"] = vector3(7.5793,6.400,7.0),
		["interact"] = {
			[1] = {
				["offset"] = vector3(8.05,6.18,6.41),
				["viewDist"] = 2.0,
				["useDist"] = 2.0,
				["generalUse"] = {"",""},
				["housingMain"] = {"to leave.","housing:frontdoor"},
				["housingSecondary"] = {"",""},
			},
		},
		["peek"] = {
			["model"] = -1388847408,
			["event"] = "ab-housing:alarmEnter",
			["id"] = "ab-housing:alarmEnter",
			["icon"] = "hammer",
			["label"] = "Disable",
			["distance"] = {radius = 2.0}
		} 
	},

	["v_int_61"] = {
		["shell"] = "V_61_shell_walls",
		["saveClient"] = false,
		["origin"] = vector3(-1153.18300000 ,-1518.34800000, 9.63082300),
		["spawnOffset"] = vector3(0.0,-4,1.0),
		["interact"] = {
			[1] = {
				["offset"] = vector3(0.72,-3.84,1.02),
				["viewDist"] = 2.0,
				["useDist"] = 2.0,
				["generalUse"] = {"",""},
				["housingMain"] = {"to leave.","housing:frontdoor"},
				["housingSecondary"] = {"",""},
			},
		},
	},

	["v_int_49_empty"] = {
		["shell"] = "v_49_motelmp_shell_2",
		["saveClient"] = false,
		["origin"] = vector3(152.09986877441 , -1004.7946166992, -98.999984741211),
		["spawnOffset"] = vector3(-0.7,-2.85,1.01),
		["interact"] = {
			[1] = {
				["offset"] = vector3(-0.91,-3.53,1.01),
				["viewDist"] = 2.0,
				["useDist"] = 2.0,
				["generalUse"] = {"",""},
				["housingMain"] = {"to leave.","housing:frontdoor"},
				["housingSecondary"] = {"",""},
			},
		},
	},

	["v_int_16_mid_empty"] = {
		["shell"] = "v_16_mid_shell_2",
		["saveClient"] = false,
		["origin"] = vector3(347.04724121094,-1000.2844848633,-99.194671630859),
		["spawnOffset"] = vector3(4.5,-14,1.8),
		["interact"] = {
			[1] = {
				["offset"] = vector3(3.65,-15.76,0.98),
				["viewDist"] = 2.0,
				["useDist"] = 2.0,
				["generalUse"] = {"",""},
				["housingMain"] = {"to leave.","housing:frontdoor"},
				["housingSecondary"] = {"",""},
			},
		},
	},

	
	["v_int_44_empty"] = {
		["shell"] = "v_44_shell_2",
		["saveClient"] = false,
		["origin"] = vector3(-801.5,178.69,72.84),
		["spawnOffset"] = vector3(-5.5793,5.100,0.0),
		["interact"] = {
			[1] = {
				["offset"] = vector3(-6.82,6.06,1.01),
				["viewDist"] = 2.0,
				["useDist"] = 2.0,
				["generalUse"] = {"",""},
				["housingMain"] = {"to leave.","housing:frontdoor"},
				["housingSecondary"] = {"",""},
			},
		},
	},

	["nopixel_trailer"] = {
		["shell"] = "nopixel_trailer",
		["saveClient"] = false,
		["origin"] = vector3(1039.59,2677.3,-150.15),
		["spawnOffset"] = vector3(-1.39,-1.44,-0.47),
		["interact"] = {
			[1] = {
				["offset"] = vector3(-1.39,-1.97,-0.47),
				["viewDist"] = 2.0,
				["useDist"] = 2.0,
				["generalUse"] = {"",""},
				["housingMain"] = {"to leave.","housing:frontdoor"},
				["housingSecondary"] = {"",""},
			},
		},
	},

	["ghost_stash_houses_01"] = {
		["shell"] = "ghost_stash_house_01",
		["saveClient"] = false,
		["origin"] = vector3(619.5334,622.9099,-116.9932),
		["spawnOffset"] = vector3(7.14,-2.65,0.12),
		["interact"] = {
			[1] = {
				["offset"] = vector3(7.14,-2.65,0.12),
				["viewDist"] = 2.0,
				["useDist"] = 2.0,
				["generalUse"] = {"",""},
				["housingMain"] = {"to leave.","housing:frontdoor"},
				["housingSecondary"] = {"",""},
			},
		},
	},

	["ghost_stash_houses_02"] = {
		["shell"] = "ghost_stash_house_03",
		["saveClient"] = false,
		["origin"] = vector3(627.9164,633.8272,-113.2648),
		["spawnOffset"] = vector3(7.14,-2.65,0.12),
		["interact"] = {
			[1] = {
				["offset"] = vector3(7.14,-2.65,0.12),
				["viewDist"] = 2.0,
				["useDist"] = 2.0,
				["generalUse"] = {"",""},
				["housingMain"] = {"to leave.","housing:frontdoor"},
				["housingSecondary"] = {"",""},
			},
		},
	},

	-- Instancing Buildings , not used on buildings that have to be created , must be already built MLO 

	["v_33_cur"] = {
		["instance"] = true,
		["origin"] = vector3(133.2307,-616.1162,205.1947),
		["darken"] = true
	}

}
