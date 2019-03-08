# Copyright 2019
# The Apes of Wrath
#
# @author Cody King
# cking@apesofwrath668.org

require 'sinatra/base'

require './models.rb'

class ApesScouter < Sinatra::Base

    get '/' do
        erb :index
    end

    # Competitions
    get '/competitions' do
        erb :competitions
    end

    # Create new competition
    get '/new_comp' do
        erb :new_competition
    end

    # List of competitions to choose from
    post '/competitions' do
        # Check parameter existence and format.
        competition = Competition.create(:name => params[:name], :year => params[:year])
        redirect "/competitions/#{competition.id}"
    end

    # Check that it is a valid project id
    before "/competitions/:id*" do
        if params[:id].to_s == "goto_err"
            halt(400, "Please select a place to go to.")
        end
        
        @competition = Competition[params[:id]]
        halt(400, "Invalid competition (id).") if @competition.nil?
    end

    # Competition page with match entries
    get "/competitions/:id" do
        # Sorting 
        cols = [] 
        DB.fetch("SHOW COLUMNS FROM matches;").each do |col|
            cols.push(col[:Field])
        end
        if cols.include?(params[:sort])
            @match_sort = params[:sort].to_sym
        else
            @match_sort = :team_number
        end
        
        erb :competition
    end

    # Competition Stats
    get "/competitions/:id/stats" do
        @competition = Competition[params[:id]]
        erb :stats
    end
    
    # Add new match entry
    get '/competitions/:id/new_match' do
        erb :new_match
    end

    # Add new match data to database
    post '/matches' do
        # Check if entry exists for team with same match number
        if DB.fetch("SELECT COUNT(*) FROM matches WHERE team_number = ? AND match_number = ?;", params[:team_number], params[:match_number]).first[:"COUNT(*)"].to_i != 0
            halt(400, "Entry found with same team number and match number. Please check your values.")
        end

        # Check parameter existence and format.
        match = Match.create(:comp_id => params[:comp_id], :team_number => params[:team_number], :match_number => params[:match_number], 
                             :name => params[:name], :preload => params[:preload], :hab_start => params[:hab_start], 
                             :hab_cross => params[:hab_cross], :sand_hatches => params[:sand_hatches], :sand_cargo => params[:sand_cargo], 
                             :low_hatches => params[:low_hatches], :mid_hatches => params[:mid_hatches], :high_hatches => params[:high_hatches], 
                             :low_cargo => params[:low_cargo], :mid_cargo => params[:mid_cargo], :high_cargo => params[:high_cargo], 
                             :cargoship_hatches => params[:cargoship_hatches], :cargoship_cargo => params[:cargoship_cargo], 
                             :dropped_hatches => params[:dropped_hatches], :dropped_cargo => params[:dropped_cargo], :climb => params[:climb],
                             :result => params[:result], :own_score => params[:own_score], :opp_score => params[:opp_score], 
                             :ranking_points => params[:ranking_points],:buddy_climb => params[:buddy_climb], :ramp_bot => params[:ramp_bot], 
                             :camera => params[:camera],:hatch_ground_pickup => params[:hatch_ground_pickup], :cargo_ground_pickup => params[:cargo_ground_pickup], 
                             :hatch_human_intake => params[:hatch_human_intake], :cargo_human_intake => params[:cargo_human_intake], 
                             :driver_skill => params[:driver_skill], :played_defense => params[:played_defense], :notes => params[:notes])
        
        redirect "/competitions/#{match.comp_id}"
    end
end

