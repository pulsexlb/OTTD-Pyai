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
        case "get_max_speed": {
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
        case "get_weight": {
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
    }
}
