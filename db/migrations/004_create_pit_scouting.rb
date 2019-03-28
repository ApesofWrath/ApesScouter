Sequel.migration do
    change do
        create_table(:pit_scouting) do
            primary_key :id
            Integer :comp_id, :null => false
            String :scouter_name, :null => false
            String :team_name, :null => false
            Integer :team_number, :null => false
            String :camera, :null => false
            Text :camera_use
            Text :sand_strat, :null => false
            String :hab_start, :null => false
            String :climb, :null => false
            Text :strategy, :null => false
            String :cargo_intake, :null => false
            String :hatch_intake, :null => false
            Text :notes
        end
    end
end
