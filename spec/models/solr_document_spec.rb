require 'rails_helper'

describe SolrDocument do
  subject { SolrDocument.new(work.to_solr) }

  context 'with metadata' do
    let(:work) do
      MusicalWork.create(
        title: ['Song'],
        genre: ['Pop'],
        composer: ['Joe Schmo'],
        composition_date: ['today'],
        visibility: 'open'
      )
    end

    its(:title) { is_expected.to contain_exactly('Song') }
    its(:genre) { is_expected.to contain_exactly('Pop') }
    its(:composer) { is_expected.to contain_exactly('Joe Schmo') }
    its(:composition_date) do
      is_expected.to contain_exactly('today')
    end
  end

  context 'with no metadata' do
    let(:work) { MusicalWork.create }

    its(:title) { is_expected.to be_empty }
    its(:composer) { is_expected.to be_empty }
    its(:genre) { is_expected.to be_empty }
    its(:title) { is_expected.to be_empty }
  end
end
