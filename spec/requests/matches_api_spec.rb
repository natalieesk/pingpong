require 'spec_helper'

describe 'Matches API' do

	context '/matches' do

    before do
      @match = create(:match)
      @player1 = @match.players.first
    end

    def update_score
      patch api_match_path(@match), { player_id: @player1.id } 

      @response, @json = response, JSON.parse(response.body)
    end

    it 'returns a success status code' do
      update_score
      expect(@response).to be_success
    end

    it 'returns a json file' do
      update_score
      expect(@json['p1points']).to eq 1
      expect(@json['p2points']).to eq 0
    end

    it 'can increment score' do
      expect { update_score }.to change { @match.current_points_for(1) }.by(1)
    end

  end
	
end


    

   