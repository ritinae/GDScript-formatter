extends Node


func update_squad() -> void:
	var factories: Array[UnitFactory] = player.selection.selected_taking_orders().map(func(o: TakesOrders): return o.entity.component(UnitFactory)).filter(func(f: UnitFactory): return f != null)
	var names := player.selection.selected_units().map(func(unit_with_long_name: Unit): return unit_with_long_name.display_name_with_suffix + " (selected unit)").filter(func(n: String): return not n.is_empty())
	var damage := player.selection.selected_units().map(func(unit: Unit): return calculate_damage_for_unit(unit, base_damage_multiplier, critical_hit_bonus_multiplier)).filter(func(n: int): return n > 0)
	var healers := (player.selection.selected_units().filter(func(unit: Unit): return unit.has_healing_ability()).map(func(unit: Unit): return unit.healing_component))
	var squad := player.selection.selected_units().filter(func(unit: Unit):
		unit.prepare_for_battle()
		return unit.is_ready_for_battle()
	).map(func(unit: Unit): return unit.squad_component_reference)
	var short := enemies.filter(func(e: Enemy): return e.is_alive()).size()
