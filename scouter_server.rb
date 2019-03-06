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

    get '/new_comp' do
        erb :new_competition
    end

    post '/competitions' do
        # Check parameter existence and format.
        competition = Competition.create(:name => params[:name], :year => params[:year])
        redirect "/competitions/#{competition.id}"
    end

    # Check that it is a valid project id
    before "/competitions/:id*" do
        @competition = Competition[params[:id]]
        halt(400, "Invalid competition (id).") if @competition.nil?
    end

    get "/competitions/:id" do
        erb :competition
    end

    get '/competitions/:id/new_match' do
        erb :new_match
    end

    # Add new match data to database
    post '/matches' do
        # Check parameter existence and format.
        match = Match.create(:comp_id => params[:comp_id], :team_number => params[:team_number], :match_number => params[:match_number], 
                             :name => params[:name], :preload => params[:preload], :hab_start => params[:hab_start], 
                             :hab_cross => params[:hab_cross], :sand_hatches => params[:sand_hatches], :sand_cargo => params[:sand_cargo], 
                             :low_hatches => 0, :mid_hatches => 0, :high_hatches => 0, :low_cargo => 0, 
                             :mid_cargo => 0, :high_cargo => 0, :cargoship_hatches => 0, :cargoship_cargo => 0, 
                             :dropped_hatches => 0, :dropped_cargo => 0, :climb => 0, :hatch_ground_pickup => 0, :cargo_ground_pickup => 0, 
                             :hatch_human_intake => 0, :cargo_human_intake => 0, :driver_skill => 0, :played_defense => 0, :notes => "")

        redirect "/competitions/#{match.comp_id}"
    end
end

