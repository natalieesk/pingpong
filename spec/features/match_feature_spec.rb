require 'spec_helper'

describe 'starting a match' do

  def create_new_match
      visit new_match_path
      fill_in 'Player 1 name:', with: 'Natalie'
      fill_in 'Player 2 name:', with: 'Will'
      click_button 'Start match!'
  end
  
  context 'starting match' do
    it 'should let you enter your name' do
      visit new_match_path
      expect(page).to have_content 'Player 1 name:'
    end

    it 'should show your name on scorer' do
    	visit new_match_path
    	fill_in 'Player 1 name:', with: 'Natalie'
    	fill_in 'Player 2 name:', with: 'Will'
    	click_button 'Start match!'
    	expect(page).to have_content 'Natalie'
    end

  end

  context "updating match" do
    it "should update a point", js: true do
      create_new_match

      expect(page).to have_css('#p1-points', text: 0)
      find('#p1-points').click
      expect(page).to have_css('#p1-points', text: 1)

    end

    it "should delete a point", js:true do
      create_new_match

      expect(page).to have_css('#p1-points', text: 0)
      find('#p1-points').click
      expect(page).to have_css('#p1-points', text: 1)
      find('#p1-back').click
      expect(page).to have_css('#p1-points', text: 0)
    end

     it "should throw an alert at end of game", js:true do
      create_new_match
      11.times {find('#p1-points').click}
      expect(page).to have_content("do you want to finish this game?")
      click_button("yes")
    end

    it "should add a game", js:true do
      create_new_match
      11.times {find('#p1-points').click}
      expect(page).to have_content("do you want to finish this game?")
      click_button("yes")
      expect(page).to have_css('#p1-points', text: 0)
      expect(page).to have_css('#p1-games', text: 1)
      expect(page).to have_css('#p2-points', text: 0)
      expect(page).to have_css('#p2-games', text: 0)
    end

   

  end

end