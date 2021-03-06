require 'rails_helper'

describe MusicalWorkPresenter do
  let(:work) do
    MusicalWork.new.tap do |work|
      work.id = "work-id"
      work.composer = ["Joe Schmo"]
      work.title = ["Song"]
      work.genre =  ["Pop"]
      work.composition_date = ["today"]
    end
  end

  let(:solr_document) { SolrDocument.new(work.to_solr) }
  let(:ability)       { Ability.new(nil) }
  let(:request)       { nil }

  subject { described_class.new(solr_document, ability, request) }

  its(:title) { is_expected.to eq(["Song"]) }
  its(:composer) { is_expected.to eq(["Joe Schmo"]) }
  its(:genre) { is_expected.to eq(["Pop"]) }
  its(:composition_date) { is_expected.to eq(["today"]) }
end
