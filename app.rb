#####################################
# Copyright 2019                    #
# The Apes of Wrath                 #
#                                   #
# @author Cody King                 #
# cking@apesofwrath668.org          #
#####################################

require 'sinatra/base'

class ApesScouter < Sinatra::Base
    get '/' do
        erb :index
    end

    get '/sfr/new_match' do
        erb :new_match
    end

    post "/sfr" do
        # Check parameter existence and format.
        halt(400, "Missing scouter name.") if params[:name].nil?
        halt(400, "Missing team number.") if params[:team_number].nil?
        match = Match.create(:team_number => params[:team_number], :match_number => 1, :scouter_name => params[:name], :hab_cross => 0, :sand_hatches => 0, :sand_cargo => 0, :low_hatches => 0, :mid_hatches => 0, :high_hatches => 0, :low_cargo => 0, :mid_cargo => 0, :high_cargo => 0, :cargoship_hatches => 0, :cargoship_cargo => 0, :dropped_pieces => 0, :climb => 0, :hatch_ground_pickup => 0, :cargo_ground_pickup => 0, :hatch_human_intake => 0, :cargo_human_intake => 0, :driver_skill => 0, :notes => "")
        redirect "/"
    end
end
