require "rails_helper"

RSpec.describe User, type: :model do
  describe "modelのvalidationが機能しているか？" do
    context "正常系" do
      let(:user) { create(:user) }

      it "ユーザー作成に成功する" do
        expect(user).to be_valid
      end
    end

    context "異常系" do
      before { @user = create(:user) }
      let(:test1) { build(:user, name: @user.name) }
      let(:test2) { build(:user, email: @user.email) }
      let(:test3) { build(:user, password: nil) }

      it "ユーザー作成に失敗する" do
        expect(test1).to be_invalid
      end
      it "ユーザー作成に失敗する" do
        expect(test2).to be_invalid
      end
      it "ユーザー作成に失敗する" do
        expect(test3).to be_invalid
      end
    end
  end
end
