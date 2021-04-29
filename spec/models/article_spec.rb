require 'rails_helper'

RSpec.describe Article, type: :model do
  
  describe '#validations' do
    # let(:article) {build(:article)}
    
    it "tests article object" do 
      article =  build(:article)
      expect(article).to be_valid
    end
  
    it 'has an invalid title' do
      article = build :article, title: ''
      expect(article).not_to be_valid
      expect(article.errors.messages[:title]).to include("can't be blank")
    end


    it 'article has content' do
      article = build :article, content: ''
      expect(article).not_to be_valid
      expect(article.errors.messages[:content]).to include("can't be blank")
    end

    it 'article has a valid slug' do
      article = build :article, slug: ''
      expect(article).not_to be_valid
      expect(article.errors.messages[:slug]).to include ("can't be blank")
    end

    it 'article has a unique slug' do
      article1 = create :article
      expect(article1).to be_valid
      article2 = build(:article, slug: article1.slug)
      expect(article2).not_to be_valid
      expect(article2.errors.messages[:slug]).to include('has already been taken')
    end
  
  end
  
  describe '.recent' do
    it 'returns articles in desc order' do
      older_article = create(:article, slug: "my-slug4", created_at: 1.minute.ago)
      recent_article = create(:article)

      expect(described_class).to eq([recent_article, older_article)
      expect(described_class.recent).to eq([recent_article, older_article)

    end
  end

end


