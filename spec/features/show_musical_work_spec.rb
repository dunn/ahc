require 'rails_helper'
include Warden::Test::Helpers

RSpec.feature 'Display a musical work' do
  let(:work) do
    MusicalWork.new.tap do |work|
      work.composer = ["Joe Schmo"]
      work.title = ["Song"]
      work.genre =  ["Pop"]
      work.composition_date = ["today"]
      work.apply_depositor_metadata("user")
      work.visibility = "open"
      work.save
    end
  end

  context 'with a public work' do
    it 'displays all the fields' do
      visit(catalog_id_path(work.id))
      expect(page).to have_content('Song')
      expect(page).to have_content('Joe Schmo')
      expect(page).to have_content('Pop')
      expect(page).to have_content('today')
    end
  end
end
