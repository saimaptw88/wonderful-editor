require "rails_helper"

RSpec.describe Comment, type: :model do
  let(:test) { create(:comment) }

  it "comment作成に成功" do
    expect(test).to be_valid
  end
end
