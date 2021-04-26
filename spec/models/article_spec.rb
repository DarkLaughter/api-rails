require 'rails_helper'

RSpec.describe Article, type: :model do
  it "tests article object" do 
    # expect(1).to be_positive

    article = create(:article)
    expect(article.title).to eq('Sample Article')
  end
end
