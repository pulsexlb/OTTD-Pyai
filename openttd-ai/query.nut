function Query(key, params) {
    switch (key) {
        case "get_costs": {
            return AIAccounting.GetCosts();
            break;
        }
        case "reset_costs": {
            return AIAccounting.ResetCosts();
            break;
        }
        case "is_valid_airport_type": {
            return AIAirport.IsValidAirportType(params.type.tointeger());
            break;
        }
        case "is_airport_information_available": {
            return AIAirport.IsAirportInformationAvailable(params.type.tointeger());
            break;
        }
        case "get_airport_price": {
            return AIAirport.GetPrice(params.type.tointeger());
            break;
        }
        case "is_hangar_tile": {
            return AIAirport.IsHangarTile(params.tile.tointeger());
            break;
        }
        case "is_airport_tile": {
            return AIAirport.IsAirportTile(params.tile.tointeger());
            break;
        }
        case "get_airport_width": {
            return AIAirport.GetAirportWidth(params.type.tointeger());
            break;
        }
        case "get_airport_height": {
            return AIAirport.GetAirportHeight(params.type.tointeger());
            break;
        }
        case "get_airport_coverage_radius": {
            return AIAirport.GetAirportCoverageRadius(params.type.tointeger());
            break;
        }
        case "get_num_hangars": {
            return AIAirport.GetNumHangars(params.tile.tointeger());
            break;
        }
        case "get_hangar_of_airport": {
            return AIAirport.GetHangarOfAirport(params.tile.tointeger());
            break;
        }
        case "build_airport": {
            return AIAirport.BuildAirport(params.tile.tointeger(), params.type.tointeger(), params.station_id.tointeger());
            break;
        }
        case "remove_airport": {
            return AIAirport.RemoveAirport(params.tile.tointeger());
            break;
        }
        case "get_airport_type": {
            return AIAirport.GetAirportType(params.tile.tointeger());
            break;
        }
        case "get_noise_level_increase": {
            return AIAirport.GetNoiseLevelIncrease(params.tile.tointeger(), params.type.tointeger());
            break;
        }
        case "get_nearest_town": {
            return AIAirport.GetNearestTown(params.tile.tointeger(), params.type.tointeger());
            break;
        }
        case "get_maintenance_cost_factor": {
            return AIAirport.GetMaintenanceCostFactor(params.type.tointeger());
            break;
        }
        case "get_monthly_maintenance_cost": {
            return AIAirport.GetMonthlyMaintenanceCost(params.type.tointeger());
            break;
        }
        case "get_airport_num_helipads": {
            return AIAirport.GetAirportNumHelipads(params.type.tointeger());
            break;
        }
        case "is_mine": {
            return AICompany.IsMine(params.company_id.tointeger());
            break;
        }
        case "set_name": {
            return AICompany.SetName(params.name);
            break;
        }
        case "set_president_name": {
            return AICompany.SetPresidentName(params.name);
            break;
        }
        case "set_president_gender": {
            return AICompany.SetPresidentGender(params.gender.tointeger());
            break;
        }
        case "set_loan_amount": {
            return AICompany.SetLoanAmount(params.loan.tointeger());
            break;
        }
        case "set_minimum_loan_amount": {
            return AICompany.SetMinimumLoanAmount(params.loan.tointeger());
            break;
        }
        case "build_company_hq": {
            return AICompany.BuildCompanyHQ(params.tile.tointeger());
            break;
        }
        case "set_auto_renew_status": {
            return AICompany.SetAutoRenewStatus(params.autorenew.tointeger());
            break;
        }
        case "set_auto_renew_months": {
            return AICompany.SetAutoRenewMonths(params.months.tointeger());
            break;
        }
        case "set_auto_renew_money": {
            return AICompany.SetAutoRenewMoney(params.money.tointeger());
            break;
        }
        case "get_quarterly_income": {
            return AICompany.GetQuarterlyIncome(params.company_id.tointeger(), params.quarter.tointeger());
            break;
        }
        case "get_quarterly_expenses": {
            return AICompany.GetQuarterlyExpenses(params.company_id.tointeger(), params.quarter.tointeger());
            break;
        }
        case "get_quarterly_cargo_delivered": {
            return AICompany.GetQuarterlyCargoDelivered(params.company_id.tointeger(), params.quarter.tointeger());
            break;
        }
        case "get_quarterly_performance_rating": {
            return AICompany.GetQuarterlyPerformanceRating(params.company_id.tointeger(), params.quarter.tointeger());
            break;
        }
        case "get_quarterly_company_value": {
            return AICompany.GetQuarterlyCompanyValue(params.company_id.tointeger(), params.quarter.tointeger());
            break;
        }
        case "get_company_name": {
            return AICompany.GetName(params.company_id.tointeger());
            break;
        }
        case "get_president_name": {
            return AICompany.GetPresidentName(params.company_id.tointeger());
            break;
        }
        case "get_president_gender": {
            return AICompany.GetPresidentGender(params.company_id.tointeger());
            break;
        }
        case "get_loan_amount": {
            return AICompany.GetLoanAmount();
            break;
        }
        case "get_max_loan_amount": {
            return AICompany.GetMaxLoanAmount();
            break;
        }
        case "get_loan_interval": {
            return AICompany.GetLoanInterval();
            break;
        }
        case "get_bank_balance": {
            return AICompany.GetBankBalance(params.company_id.tointeger());
            break;
        }
        case "get_company_hq": {
            return AICompany.GetCompanyHQ(params.company_id.tointeger());
            break;
        }
        case "get_auto_renew_status": {
            return AICompany.GetAutoRenewStatus(params.company_id.tointeger());
            break;
        }
        case "get_auto_renew_months": {
            return AICompany.GetAutoRenewMonths(params.company_id.tointeger());
            break;
        }
        case "get_auto_renew_money": {
            return AICompany.GetAutoRenewMoney(params.company_id.tointeger());
            break;
        }
        case "is_valid_bridge": {
            return AIBridge.IsValidBridge(params.bridge_type.tointeger());
            break;
        }
        case "is_bridge_tile": {
            return AIBridge.IsBridgeTile(params.tile.tointeger());
            break;
        }
        case "get_bridge_type": {
            return AIBridge.GetBridgeType(params.tile.tointeger());
            break;
        }
        case "get_bridge_name": {
            return AIBridge.GetName(params.bridge_type.tointeger(), params.vehicle_type.tointeger());
            break;
        }
        case "get_bridge_max_speed": {
            return AIBridge.GetMaxSpeed(params.bridge_type.tointeger());
            break;
        }
        case "get_bridge_price": {
            return AIBridge.GetPrice(params.bridge_type.tointeger(), params.length.tointeger());
            break;
        }
        case "get_max_length": {
            return AIBridge.GetMaxLength(params.bridge_type.tointeger());
            break;
        }
        case "get_min_length": {
            return AIBridge.GetMinLength(params.bridge_type.tointeger());
            break;
        }
        case "build_bridge": {
            return AIBridge.BuildBridge(params.vehicle_type.tointeger(), params.bridge_type.tointeger(), params.start.tointeger(), params.end.tointeger());
            break;
        }
        case "remove_bridge": {
            return AIBridge.RemoveBridge(params.tile.tointeger());
            break;
        }
        case "get_other_bridge_end": {
            return AIBridge.GetOtherBridgeEnd(params.tile.tointeger());
            break;
        }
        case "is_valid_cargo": {
            return AICargo.IsValidCargo(params.cargo_type.tointeger());
            break;
        }
        case "is_valid_town_effect": {
            return AICargo.IsValidTownEffect(params.towneffect_type.tointeger());
            break;
        }
        case "get_cargo_name": {
            return AICargo.GetName(params.cargo_type.tointeger());
            break;
        }
        case "get_cargo_label": {
            return AICargo.GetCargoLabel(params.cargo_type.tointeger());
            break;
        }
        case "is_freight": {
            return AICargo.IsFreight(params.cargo_type.tointeger());
            break;
        }
        case "has_cargo_class": {
            return AICargo.HasCargoClass(params.cargo_type.tointeger(), params.cargo_class.tointeger());
            break;
        }
        case "get_town_effect": {
            return AICargo.GetTownEffect(params.cargo_type.tointeger());
            break;
        }
        case "get_cargo_income": {
            return AICargo.GetCargoIncome(params.cargo_type.tointeger(), params.distance.tointeger(), params.days_in_transit.tointeger());
            break;
        }
        case "get_distribution_type": {
            return AICargo.GetDistributionType(params.cargo_type.tointeger());
            break;
        }
        case "get_weight": {
            return AICargo.GetWeight(params.cargo_type.tointeger(), params.amount.tointeger());
            break;
        }
        case "is_valid_base_station": {
            return AIBaseStation.IsValidBaseStation(params.station_id.tointeger());
            break;
        }
        case "get_base_station_name": {
            return AIBaseStation.GetName(params.station_id.tointeger());
            break;
        }
        case "set_base_station_name": {
            return AIBaseStation.SetName(params.station_id.tointeger(), params.name);
            break;
        }
        case "get_base_station_location": {
            return AIBaseStation.GetLocation(params.station_id.tointeger());
            break;
        }
        case "get_base_station_construction_date": {
            return AIBaseStation.GetConstructionDate(params.station_id.tointeger());
            break;
        }
        case "is_valid_engine": {
            return AIEngine.IsValidEngine(params.engine_id.tointeger());
            break;
        }
        case "is_engine_buildable": {
            return AIEngine.IsBuildable(params.engine_id.tointeger());
            break;
        }
        case "get_engine_name": {
            return AIEngine.GetName(params.engine_id.tointeger());
            break;
        }
        case "get_engine_price": {
            return AIEngine.GetPrice(params.engine_id.tointeger());
            break;
        }
        case "get_engine_cargo_type": {
            return AIEngine.GetCargoType(params.engine_id.tointeger());
            break;
        }
        case "can_refit_cargo": {
            return AIEngine.CanRefitCargo(params.engine_id.tointeger(), params.cargo_type.tointeger());
            break;
        }
        case "can_pull_cargo": {
            return AIEngine.CanPullCargo(params.engine_id.tointeger(), params.cargo_type.tointeger());
            break;
        }
        case "get_capacity": {
            return AIEngine.GetCapacity(params.engine_id.tointeger());
            break;
        }
        case "get_reliability": {
            return AIEngine.GetReliability(params.engine_id.tointeger());
            break;
        }
        case "get_max_speed": {
            return AIEngine.GetMaxSpeed(params.engine_id.tointeger());
            break;
        }
        case "get_max_age": {
            return AIEngine.GetMaxAge(params.engine_id.tointeger());
            break;
        }
        case "get_running_cost": {
            return AIEngine.GetRunningCost(params.engine_id.tointeger());
            break;
        }
        case "get_power": {
            return AIEngine.GetPower(params.engine_id.tointeger());
            break;
        }
        case "get_engine_weight": {
            return AIEngine.GetWeight(params.engine_id.tointeger());
            break;
        }
        case "get_max_tractive_effort": {
            return AIEngine.GetMaxTractiveEffort(params.engine_id.tointeger());
            break;
        }
        case "get_design_date": {
            return AIEngine.GetDesignDate(params.engine_id.tointeger());
            break;
        }
        case "get_vehicle_type": {
            return AIEngine.GetVehicleType(params.engine_id.tointeger());
            break;
        }
        case "is_wagon": {
            return AIEngine.IsWagon(params.engine_id.tointeger());
            break;
        }
        case "can_run_on_rail": {
            return AIEngine.CanRunOnRail(params.engine_id.tointeger(), params.track_rail_type.tointeger());
            break;
        }
        case "has_power_on_rail": {
            return AIEngine.HasPowerOnRail(params.engine_id.tointeger(), params.track_rail_type.tointeger());
            break;
        }
        case "can_run_on_road": {
            return AIEngine.CanRunOnRoad(params.engine_id.tointeger(), params.road_type.tointeger());
            break;
        }
        case "has_power_on_road": {
            return AIEngine.HasPowerOnRoad(params.engine_id.tointeger(), params.road_type.tointeger());
            break;
        }
        case "get_road_type": {
            return AIEngine.GetRoadType(params.engine_id.tointeger());
            break;
        }
        case "get_rail_type": {
            return AIEngine.GetRailType(params.engine_id.tointeger());
            break;
        }
        case "is_articulated": {
            return AIEngine.IsArticulated(params.engine_id.tointeger());
            break;
        }
        case "get_plane_type": {
            return AIEngine.GetPlaneType(params.engine_id.tointeger());
            break;
        }
        case "get_maximum_order_distance": {
            return AIEngine.GetMaximumOrderDistance(params.engine_id.tointeger());
            break;
        }
        case "is_valid": {
            return AIGameSettings.IsValid(params.setting);
            break;
        }
        case "get_value": {
            return AIGameSettings.GetValue(params.setting);
            break;
        }
        case "is_disabled_vehicle_type": {
            return AIGameSettings.IsDisabledVehicleType(params.vehicle_type.tointeger());
            break;
        }
        case "rand": {
            return AIBase.Rand();
            break;
        }
        case "rand_item": {
            return AIBase.RandItem(params.unused_param.tointeger());
            break;
        }
        case "rand_range": {
            return AIBase.RandRange(params.max.tointeger());
            break;
        }
        case "rand_range_item": {
            return AIBase.RandRangeItem(params.unused_param.tointeger(), params.max.tointeger());
            break;
        }
        case "chance": {
            return AIBase.Chance(params.out.tointeger(), params.max.tointeger());
            break;
        }
        case "chance_item": {
            return AIBase.ChanceItem(params.unused_param.tointeger(), params.out.tointeger(), params.max.tointeger());
            break;
        }
        case "is_valid_date": {
            return AIDate.IsValidDate(params.date.tointeger());
            break;
        }
        case "get_current_date": {
            return AIDate.GetCurrentDate();
            break;
        }
        case "get_year": {
            return AIDate.GetYear(params.date.tointeger());
            break;
        }
        case "get_month": {
            return AIDate.GetMonth(params.date.tointeger());
            break;
        }
        case "get_day_of_month": {
            return AIDate.GetDayOfMonth(params.date.tointeger());
            break;
        }
        case "get_date": {
            return AIDate.GetDate(params.year.tointeger(), params.month.tointeger(), params.day_of_month.tointeger());
            break;
        }
        case "get_error_category": {
            return AIError.GetErrorCategory();
            break;
        }
        case "get_last_error": {
            return AIError.GetLastError();
            break;
        }
        case "get_last_error_string": {
            return AIError.GetLastErrorString();
            break;
        }
        case "log_info": {
            return AILog.Info(params.message);
            break;
        }
        case "log_warning": {
            return AILog.Warning(params.message);
            break;
        }
        case "log_error": {
            return AILog.Error(params.message);
            break;
        }
        case "is_valid_tile": {
            return AIMap.IsValidTile(params.tile.tointeger());
            break;
        }
        case "get_map_size": {
            return AIMap.GetMapSize();
            break;
        }
        case "get_map_size_x": {
            return AIMap.GetMapSizeX();
            break;
        }
        case "get_map_size_y": {
            return AIMap.GetMapSizeY();
            break;
        }
        case "get_tile_x": {
            return AIMap.GetTileX(params.tile.tointeger());
            break;
        }
        case "get_tile_y": {
            return AIMap.GetTileY(params.tile.tointeger());
            break;
        }
        case "get_tile_index": {
            return AIMap.GetTileIndex(params.x.tointeger(), params.y.tointeger());
            break;
        }
        case "distance_manhattan": {
            return AIMap.DistanceManhattan(params.tile_from.tointeger(), params.tile_to.tointeger());
            break;
        }
        case "distance_max": {
            return AIMap.DistanceMax(params.tile_from.tointeger(), params.tile_to.tointeger());
            break;
        }
        case "distance_square": {
            return AIMap.DistanceSquare(params.tile_from.tointeger(), params.tile_to.tointeger());
            break;
        }
        case "distance_from_edge": {
            return AIMap.DistanceFromEdge(params.tile.tointeger());
            break;
        }
        case "is_valid_sign": {
            return AISign.IsValidSign(params.sign_id.tointeger());
            break;
        }
        case "set_sign_name": {
            return AISign.SetName(params.sign_id.tointeger(), params.name);
            break;
        }
        case "get_sign_name": {
            return AISign.GetName(params.sign_id.tointeger());
            break;
        }
        case "get_sign_location": {
            return AISign.GetLocation(params.sign_id.tointeger());
            break;
        }
        case "build_sign": {
            return AISign.BuildSign(params.location.tointeger(), params.name);
            break;
        }
        case "remove_sign": {
            return AISign.RemoveSign(params.sign_id.tointeger());
            break;
        }
        case "is_valid_subsidy": {
            return AISubsidy.IsValidSubsidy(params.subsidy_id.tointeger());
            break;
        }
        case "is_awarded": {
            return AISubsidy.IsAwarded(params.subsidy_id.tointeger());
            break;
        }
        case "get_awarded_to": {
            return AISubsidy.GetAwardedTo(params.subsidy_id.tointeger());
            break;
        }
        case "get_expire_date": {
            return AISubsidy.GetExpireDate(params.subsidy_id.tointeger());
            break;
        }
        case "get_cargo_type": {
            return AISubsidy.GetCargoType(params.subsidy_id.tointeger());
            break;
        }
        case "get_source_type": {
            return AISubsidy.GetSourceType(params.subsidy_id.tointeger());
            break;
        }
        case "get_source_index": {
            return AISubsidy.GetSourceIndex(params.subsidy_id.tointeger());
            break;
        }
        case "get_destination_type": {
            return AISubsidy.GetDestinationType(params.subsidy_id.tointeger());
            break;
        }
        case "get_destination_index": {
            return AISubsidy.GetDestinationIndex(params.subsidy_id.tointeger());
            break;
        }
        case "is_tunnel_tile": {
            return AITunnel.IsTunnelTile(params.tile.tointeger());
            break;
        }
        case "get_other_tunnel_end": {
            return AITunnel.GetOtherTunnelEnd(params.tile.tointeger());
            break;
        }
        case "is_loaded": {
            return AINewGRF.IsLoaded(params.grf_id.tointeger());
            break;
        }
        case "get_road_count": {
            return AIInfrastructure.GetRoadCount(params.roadtype.tointeger());
            break;
        }
        case "get_rail_count": {
            return AIInfrastructure.GetRailCount(params.railtype.tointeger());
            break;
        }
        case "get_bridge_count": {
            return AIInfrastructure.GetBridgeCount(params.bridge_type.tointeger());
            break;
        }
        case "get_tunnel_count": {
            return AIInfrastructure.GetTunnelCount();
            break;
        }
        case "get_signal_count": {
            return AIInfrastructure.GetSignalCount();
            break;
        }
        case "get_station_count": {
            return AIInfrastructure.GetStationCount();
            break;
        }
        case "is_valid_waypoint": {
            return AIWaypoint.IsValidWaypoint(params.waypoint_id.tointeger());
            break;
        }
        case "get_waypoint_id": {
            return AIWaypoint.GetWaypointID(params.tile.tointeger());
            break;
        }
        case "has_waypoint_type": {
            return AIWaypoint.HasWaypointType(params.waypoint_id.tointeger(), params.waypoint_type.tointeger());
            break;
        }
        case "is_valid_group": {
            return AIGroup.IsValidGroup(params.group_id.tointeger());
            break;
        }
        case "create_group": {
            return AIGroup.CreateGroup(params.vehicle_type.tointeger(), params.parent_group_id.tointeger());
            break;
        }
        case "delete_group": {
            return AIGroup.DeleteGroup(params.group_id.tointeger());
            break;
        }
        case "set_group_name": {
            return AIGroup.SetName(params.group_id.tointeger(), params.name);
            break;
        }
        case "get_group_name": {
            return AIGroup.GetName(params.group_id.tointeger());
            break;
        }
        case "set_parent": {
            return AIGroup.SetParent(params.group_id.tointeger(), params.parent_group_id.tointeger());
            break;
        }
        case "get_parent": {
            return AIGroup.GetParent(params.group_id.tointeger());
            break;
        }
        case "enable_auto_replace_protection": {
            return AIGroup.EnableAutoReplaceProtection(params.group_id.tointeger(), params.enable.tointeger());
            break;
        }
        case "get_auto_replace_protection": {
            return AIGroup.GetAutoReplaceProtection(params.group_id.tointeger());
            break;
        }
        case "get_num_engines": {
            return AIGroup.GetNumEngines(params.group_id.tointeger(), params.engine_id.tointeger());
            break;
        }
        case "get_num_vehicles": {
            return AIGroup.GetNumVehicles(params.group_id.tointeger(), params.vehicle_type.tointeger());
            break;
        }
        case "move_vehicle": {
            return AIGroup.MoveVehicle(params.group_id.tointeger(), params.vehicle_id.tointeger());
            break;
        }
        case "get_profit_this_year": {
            return AIGroup.GetProfitThisYear(params.group_id.tointeger());
            break;
        }
        case "get_profit_last_year": {
            return AIGroup.GetProfitLastYear(params.group_id.tointeger());
            break;
        }
        case "get_current_usage": {
            return AIGroup.GetCurrentUsage(params.group_id.tointeger());
            break;
        }
        case "is_water_depot_tile": {
            return AIMarine.IsWaterDepotTile(params.tile.tointeger());
            break;
        }
        case "is_dock_tile": {
            return AIMarine.IsDockTile(params.tile.tointeger());
            break;
        }
        case "is_buoy_tile": {
            return AIMarine.IsBuoyTile(params.tile.tointeger());
            break;
        }
        case "is_lock_tile": {
            return AIMarine.IsLockTile(params.tile.tointeger());
            break;
        }
        case "is_canal_tile": {
            return AIMarine.IsCanalTile(params.tile.tointeger());
            break;
        }
        case "are_water_tiles_connected": {
            return AIMarine.AreWaterTilesConnected(params.tile_from.tointeger(), params.tile_to.tointeger());
            break;
        }
        case "build_water_depot": {
            return AIMarine.BuildWaterDepot(params.tile.tointeger(), params.front.tointeger());
            break;
        }
        case "build_dock": {
            return AIMarine.BuildDock(params.tile.tointeger(), params.station_id.tointeger());
            break;
        }
        case "build_buoy": {
            return AIMarine.BuildBuoy(params.tile.tointeger());
            break;
        }
        case "build_lock": {
            return AIMarine.BuildLock(params.tile.tointeger());
            break;
        }
        case "build_canal": {
            return AIMarine.BuildCanal(params.tile.tointeger());
            break;
        }
        case "remove_water_depot": {
            return AIMarine.RemoveWaterDepot(params.tile.tointeger());
            break;
        }
        case "remove_dock": {
            return AIMarine.RemoveDock(params.tile.tointeger());
            break;
        }
        case "remove_buoy": {
            return AIMarine.RemoveBuoy(params.tile.tointeger());
            break;
        }
        case "remove_lock": {
            return AIMarine.RemoveLock(params.tile.tointeger());
            break;
        }
        case "remove_canal": {
            return AIMarine.RemoveCanal(params.tile.tointeger());
            break;
        }
        case "get_build_cost": {
            return AIMarine.GetBuildCost(params.build_type.tointeger());
            break;
        }
        case "is_valid_object_type": {
            return AIObjectType.IsValidObjectType(params.object_type.tointeger());
            break;
        }
        case "get_object_type_name": {
            return AIObjectType.GetName(params.object_type.tointeger());
            break;
        }
        case "get_views": {
            return AIObjectType.GetViews(params.object_type.tointeger());
            break;
        }
        case "build_object": {
            return AIObjectType.BuildObject(params.object_type.tointeger(), params.view.tointeger(), params.tile.tointeger());
            break;
        }
        case "resolve_newgrf_id": {
            return AIObjectType.ResolveNewGRFID(params.grfid.tointeger(), params.grf_local_id.tointeger());
            break;
        }
        case "get_industry_count": {
            return AIIndustry.GetIndustryCount();
            break;
        }
        case "is_valid_industry": {
            return AIIndustry.IsValidIndustry(params.industry_id.tointeger());
            break;
        }
        case "get_industry_id": {
            return AIIndustry.GetIndustryID(params.tile.tointeger());
            break;
        }
        case "get_industry_name": {
            return AIIndustry.GetName(params.industry_id.tointeger());
            break;
        }
        case "is_cargo_accepted": {
            return AIIndustry.IsCargoAccepted(params.industry_id.tointeger(), params.cargo_type.tointeger());
            break;
        }
        case "get_stockpiled_cargo": {
            return AIIndustry.GetStockpiledCargo(params.industry_id.tointeger(), params.cargo_type.tointeger());
            break;
        }
        case "get_last_month_production": {
            return AIIndustry.GetLastMonthProduction(params.industry_id.tointeger(), params.cargo_type.tointeger());
            break;
        }
        case "get_last_month_transported": {
            return AIIndustry.GetLastMonthTransported(params.industry_id.tointeger(), params.cargo_type.tointeger());
            break;
        }
        case "get_last_month_transported_percentage": {
            return AIIndustry.GetLastMonthTransportedPercentage(params.industry_id.tointeger(), params.cargo_type.tointeger());
            break;
        }
        case "get_industry_location": {
            return AIIndustry.GetLocation(params.industry_id.tointeger());
            break;
        }
        case "get_amount_of_stations_around": {
            return AIIndustry.GetAmountOfStationsAround(params.industry_id.tointeger());
            break;
        }
        case "get_distance_manhattan_to_tile": {
            return AIIndustry.GetDistanceManhattanToTile(params.industry_id.tointeger(), params.tile.tointeger());
            break;
        }
        case "get_distance_square_to_tile": {
            return AIIndustry.GetDistanceSquareToTile(params.industry_id.tointeger(), params.tile.tointeger());
            break;
        }
        case "is_built_on_water": {
            return AIIndustry.IsBuiltOnWater(params.industry_id.tointeger());
            break;
        }
        case "has_heliport": {
            return AIIndustry.HasHeliport(params.industry_id.tointeger());
            break;
        }
        case "get_heliport_location": {
            return AIIndustry.GetHeliportLocation(params.industry_id.tointeger());
            break;
        }
        case "has_dock": {
            return AIIndustry.HasDock(params.industry_id.tointeger());
            break;
        }
        case "get_dock_location": {
            return AIIndustry.GetDockLocation(params.industry_id.tointeger());
            break;
        }
        case "get_industry_type": {
            return AIIndustry.GetIndustryType(params.industry_id.tointeger());
            break;
        }
        case "get_exclusive_supplier": {
            return AIIndustry.GetExclusiveSupplier(params.industry_id.tointeger());
            break;
        }
        case "get_exclusive_consumer": {
            return AIIndustry.GetExclusiveConsumer(params.industry_id.tointeger());
            break;
        }
        case "is_valid_industry_type": {
            return AIIndustryType.IsValidIndustryType(params.industry_type.tointeger());
            break;
        }
        case "get_industry_type_name": {
            return AIIndustryType.GetName(params.industry_type.tointeger());
            break;
        }
        case "get_built_industries": {
            return AIIndustryType.GetBuiltIndustries(params.industry_type.tointeger());
            break;
        }
        case "get_industry_type_production_cargo": {
            return AIIndustryType.ProducesCargo(params.industry_type.tointeger(), params.cargo_type.tointeger());
            break;
        }
        case "get_industry_type_accepted_cargo": {
            return AIIndustryType.AcceptsCargo(params.industry_type.tointeger(), params.cargo_type.tointeger());
            break;
        }
        case "get_industry_type_build_cost": {
            return AIIndustryType.GetBuildCost(params.industry_type.tointeger());
            break;
        }
        case "get_town_count": {
            return AITown.GetTownCount();
            break;
        }
        case "is_valid_town": {
            return AITown.IsValidTown(params.town_id.tointeger());
            break;
        }
        case "get_town_name": {
            return AITown.GetName(params.town_id.tointeger());
            break;
        }
        case "get_population": {
            return AITown.GetPopulation(params.town_id.tointeger());
            break;
        }
        case "get_house_count": {
            return AITown.GetHouseCount(params.town_id.tointeger());
            break;
        }
        case "get_town_location": {
            return AITown.GetLocation(params.town_id.tointeger());
            break;
        }
        case "get_last_month_supplied": {
            return AITown.GetLastMonthSupplied(params.town_id.tointeger(), params.cargo_type.tointeger());
            break;
        }
        case "get_town_last_month_transported_percentage": {
            return AITown.GetLastMonthTransportedPercentage(params.town_id.tointeger(), params.cargo_type.tointeger());
            break;
        }
        case "get_last_month_received": {
            return AITown.GetLastMonthReceived(params.town_id.tointeger(), params.towneffect_id.tointeger());
            break;
        }
        case "get_cargo_goal": {
            return AITown.GetCargoGoal(params.town_id.tointeger(), params.towneffect_id.tointeger());
            break;
        }
        case "get_growth_rate": {
            return AITown.GetGrowthRate(params.town_id.tointeger());
            break;
        }
        case "get_town_last_month_production": {
            return AITown.GetLastMonthProduction(params.town_id.tointeger(), params.cargo_type.tointeger());
            break;
        }
        case "get_town_distance_manhattan_to_tile": {
            return AITown.GetDistanceManhattanToTile(params.town_id.tointeger(), params.tile.tointeger());
            break;
        }
        case "get_town_distance_square_to_tile": {
            return AITown.GetDistanceSquareToTile(params.town_id.tointeger(), params.tile.tointeger());
            break;
        }
        case "is_within_town_influence": {
            return AITown.IsWithinTownInfluence(params.town_id.tointeger(), params.tile.tointeger());
            break;
        }
        case "has_statue": {
            return AITown.HasStatue(params.town_id.tointeger());
            break;
        }
        case "is_city": {
            return AITown.IsCity(params.town_id.tointeger());
            break;
        }
        case "get_road_rework_duration": {
            return AITown.GetRoadReworkDuration(params.town_id.tointeger());
            break;
        }
        case "get_fund_buildings_duration": {
            return AITown.GetFundBuildingsDuration(params.town_id.tointeger());
            break;
        }
        case "get_exclusive_rights_company": {
            return AITown.GetExclusiveRightsCompany(params.town_id.tointeger());
            break;
        }
        case "get_exclusive_rights_duration": {
            return AITown.GetExclusiveRightsDuration(params.town_id.tointeger());
            break;
        }
        case "is_action_available": {
            return AITown.IsActionAvailable(params.town_id.tointeger(), params.town_action.tointeger());
            break;
        }
        case "perform_town_action": {
            return AITown.PerformTownAction(params.town_id.tointeger(), params.town_action.tointeger());
            break;
        }
        case "get_rating": {
            return AITown.GetRating(params.town_id.tointeger(), params.company_id.tointeger());
            break;
        }
        case "get_allowed_noise": {
            return AITown.GetAllowedNoise(params.town_id.tointeger());
            break;
        }
        case "get_road_layout": {
            return AITown.GetRoadLayout(params.town_id.tointeger());
            break;
        }
        case "found_town": {
            return AITown.FoundTown(params.tile.tointeger(), params.size.tointeger(), params.city.tointeger(), params.layout.tointeger(), params.name);
            break;
        }
        case "is_valid_vehicle_order": {
            return AIOrder.IsValidVehicleOrder(params.vehicle_id.tointeger(), params.order_position.tointeger());
            break;
        }
        case "get_order_count": {
            return AIOrder.GetOrderCount(params.vehicle_id.tointeger());
            break;
        }
        case "get_order_destination": {
            return AIOrder.GetOrderDestination(params.vehicle_id.tointeger(), params.order_position.tointeger());
            break;
        }
        case "append_order": {
            return AIOrder.AppendOrder(params.vehicle_id.tointeger(), params.destination.tointeger(), params.order_flags.tointeger());
            break;
        }
        case "insert_order": {
            return AIOrder.InsertOrder(params.vehicle_id.tointeger(), params.order_position.tointeger(), params.destination.tointeger(), params.order_flags.tointeger());
            break;
        }
        case "remove_order": {
            return AIOrder.RemoveOrder(params.vehicle_id.tointeger(), params.order_position.tointeger());
            break;
        }
        case "skip_to_order": {
            return AIOrder.SkipToOrder(params.vehicle_id.tointeger(), params.next_order.tointeger());
            break;
        }
        case "move_order": {
            return AIOrder.MoveOrder(params.vehicle_id.tointeger(), params.order_position_move.tointeger(), params.order_position_target.tointeger());
            break;
        }
        case "copy_orders": {
            return AIOrder.CopyOrders(params.vehicle_id.tointeger(), params.main_vehicle_id.tointeger());
            break;
        }
        case "share_orders": {
            return AIOrder.ShareOrders(params.vehicle_id.tointeger(), params.main_vehicle_id.tointeger());
            break;
        }
        case "unshare_orders": {
            return AIOrder.UnshareOrders(params.vehicle_id.tointeger());
            break;
        }
        case "get_order_distance": {
            return AIOrder.GetOrderDistance(params.vehicle_type.tointeger(), params.origin_tile.tointeger(), params.dest_tile.tointeger());
            break;
        }
        case "is_valid_vehicle": {
            return AIVehicle.IsValidVehicle(params.vehicle_id.tointeger());
            break;
        }
        case "is_primary_vehicle": {
            return AIVehicle.IsPrimaryVehicle(params.vehicle_id.tointeger());
            break;
        }
        case "get_vehicle_name": {
            return AIVehicle.GetName(params.vehicle_id.tointeger());
            break;
        }
        case "get_engine_type": {
            return AIVehicle.GetEngineType(params.vehicle_id.tointeger());
            break;
        }
        case "get_unit_number": {
            return AIVehicle.GetUnitNumber(params.vehicle_id.tointeger());
            break;
        }
        case "get_current_speed": {
            return AIVehicle.GetCurrentSpeed(params.vehicle_id.tointeger());
            break;
        }
        case "get_vehicle_profit_this_year": {
            return AIVehicle.GetProfitThisYear(params.vehicle_id.tointeger());
            break;
        }
        case "get_vehicle_profit_last_year": {
            return AIVehicle.GetProfitLastYear(params.vehicle_id.tointeger());
            break;
        }
        case "get_current_value": {
            return AIVehicle.GetCurrentValue(params.vehicle_id.tointeger());
            break;
        }
        case "get_vehicle_age": {
            return AIVehicle.GetAge(params.vehicle_id.tointeger());
            break;
        }
        case "get_cargo_load": {
            return AIVehicle.GetCargoLoad(params.vehicle_id.tointeger());
            break;
        }
        case "get_group_id": {
            return AIVehicle.GetGroupID(params.vehicle_id.tointeger());
            break;
        }
        case "build_vehicle": {
            return AIVehicle.BuildVehicle(params.depot.tointeger(), params.engine_id.tointeger());
            break;
        }
        case "get_vehicle_location": {
            return AIVehicle.GetLocation(params.vehicle_id.tointeger());
            break;
        }
        case "get_vehicle_vehicle_type": {
            return AIVehicle.GetVehicleType(params.vehicle_id.tointeger());
            break;
        }
        case "get_vehicle_max_age": {
            return AIVehicle.GetMaxAge(params.vehicle_id.tointeger());
            break;
        }
        case "get_vehicle_capacity": {
            return AIVehicle.GetCapacity(params.vehicle_id.tointeger());
            break;
        }
        case "get_vehicle_cargo_type": {
            return AIVehicle.GetCargoType(params.vehicle_id.tointeger());
            break;
        }
        case "get_vehicle_max_speed": {
            return AIVehicle.GetMaxSpeed(params.vehicle_id.tointeger());
            break;
        }
        case "sell_vehicle": {
            return AIVehicle.SellVehicle(params.vehicle_id.tointeger());
            break;
        }
        case "send_vehicle_to_depot": {
            return AIVehicle.SendVehicleToDepot(params.vehicle_id.tointeger());
            break;
        }
        case "start_stop_vehicle": {
            return AIVehicle.StartStopVehicle(params.vehicle_id.tointeger());
            break;
        }
        case "clone_vehicle": {
            return AIVehicle.CloneVehicle(params.tile.tointeger(), params.vehicle_id.tointeger(), params.share_orders.tointeger());
            break;
        }
        case "refit_vehicle": {
            return AIVehicle.RefitVehicle(params.vehicle_id.tointeger(), params.cargo_type.tointeger());
            break;
        }
        case "get_max_order_distance": {
            return AIVehicle.GetMaximumOrderDistance(params.vehicle_id.tointeger());
            break;
        }
        case "is_in_depot": {
            return AIVehicle.IsInDepot(params.vehicle_id.tointeger());
            break;
        }
        case "is_stopped_in_depot": {
            return AIVehicle.IsStoppedInDepot(params.vehicle_id.tointeger());
            break;
        }
        case "has_shared_orders": {
            return AIVehicle.HasSharedOrders(params.vehicle_id.tointeger());
            break;
        }
        case "get_vehicle_running_cost": {
            return AIVehicle.GetRunningCost(params.vehicle_id.tointeger());
            break;
        }
        case "is_rail_type_available": {
            return AIRail.IsRailTypeAvailable(params.railtype.tointeger());
            break;
        }
        case "build_rail": {
            return AIRail.BuildRail(params.tile.tointeger(), params.track_rail_type.tointeger());
            break;
        }
        case "remove_rail": {
            return AIRail.RemoveRail(params.tile.tointeger(), params.track_rail_type.tointeger());
            break;
        }
        case "build_signal": {
            return AIRail.BuildSignal(params.tile.tointeger(), params.signal_type.tointeger());
            break;
        }
        case "get_signal_type": {
            return AIRail.GetSignalType(params.tile.tointeger());
            break;
        }
        case "build_train_depot": {
            return AIRail.BuildTrainDepot(params.tile.tointeger(), params.front.tointeger());
            break;
        }
        case "build_rail_station": {
            return AIRail.BuildRailStation(params.tile.tointeger(), params.direction.tointeger(), params.num_platforms.tointeger(), params.station_length.tointeger(), params.station_id.tointeger());
            break;
        }
        case "is_road_type_available": {
            return AIRoad.IsRoadTypeAvailable(params.roadtype.tointeger());
            break;
        }
        case "build_road": {
            return AIRoad.BuildRoad(params.tile.tointeger(), params.roadtype.tointeger());
            break;
        }
        case "remove_road": {
            return AIRoad.RemoveRoad(params.tile.tointeger(), params.roadtype.tointeger());
            break;
        }
        case "build_road_depot": {
            return AIRoad.BuildRoadDepot(params.tile.tointeger(), params.front.tointeger());
            break;
        }
        case "build_bus_station": {
            return AIRoad.BuildBusStation(params.tile.tointeger(), params.direction.tointeger(), params.station_id.tointeger());
            break;
        }
        case "build_truck_station": {
            return AIRoad.BuildTruckStation(params.tile.tointeger(), params.direction.tointeger(), params.station_id.tointeger());
            break;
        }
        case "get_corner_height": {
            return AITile.GetCornerHeight(params.tile.tointeger(), params.corner.tointeger());
            break;
        }
        case "get_slope": {
            return AITile.GetSlope(params.tile.tointeger());
            break;
        }
        case "is_buildable": {
            return AITile.IsBuildable(params.tile.tointeger());
            break;
        }
        case "has_tree_on_tile": {
            return AITile.HasTreeOnTile(params.tile.tointeger());
            break;
        }
        case "is_sea_tile": {
            return AITile.IsSeaTile(params.tile.tointeger());
            break;
        }
        case "is_river_tile": {
            return AITile.IsRiverTile(params.tile.tointeger());
            break;
        }
        case "is_water_tile": {
            return AITile.IsWaterTile(params.tile.tointeger());
            break;
        }
        case "is_station_tile": {
            return AITile.IsStationTile(params.tile.tointeger());
            break;
        }
        case "is_demolishable": {
            return AITile.IsDemolishable(params.tile.tointeger());
            break;
        }
        case "demolish_tile": {
            return AITile.DemolishTile(params.tile.tointeger());
            break;
        }
        case "raise_tile": {
            return AITile.RaiseTile(params.tile.tointeger());
            break;
        }
        case "lower_tile": {
            return AITile.LowerTile(params.tile.tointeger());
            break;
        }
        case "plant_tree": {
            return AITile.PlantTree(params.tile.tointeger());
            break;
        }
    }
