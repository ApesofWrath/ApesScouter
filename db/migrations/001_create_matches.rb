# Copyright 2019#
# The Apes of Wrath
#
# @author Cody King
# cking@apesofwrath668.org

Sequel.migration do
    change do
        create_table(:matches) do
            primary_key :id
            Integer :comp_id, :null => false
            Integer :team_number, :null => false
            Integer :match_number, :null => false
            String :name, :null => false
            String :preload, :null => false
            Integer :hab_start, :null => false
            Integer :hab_cross, :null => false
            Integer :sand_hatches, :null => false
            Integer :sand_cargo, :null => false
            Integer :low_hatches, :null => false
            Integer :mid_hatches, :null => false
            Integer :high_hatches, :null => false
            Integer :low_cargo, :null => false
            Integer :mid_cargo, :null => false
            Integer :high_cargo, :null => false
            Integer :cargoship_hatches, :null => false
            Integer :cargoship_cargo, :null => false
            Integer :dropped_hatches, :null => false
            Integer :dropped_cargo, :null => false
            Integer :climb, :null => false
            Integer :hatch_ground_pickup, :null => false
            Integer :cargo_ground_pickup, :null => false
            Integer :hatch_human_intake, :null => false
            Integer :cargo_human_intake, :null => false
            Integer :driver_skill, :null => false
            Integer :played_defense, :null => false
            Text :notes, :null => false, :default => ""
        end
    end
end

