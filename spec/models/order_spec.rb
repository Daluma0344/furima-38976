require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order = FactoryBot.build(:order, user_id: user.id, item_id: item.id)
   end


  describe '配送先情報の保存' do
    context '配送先情報の保存ができるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order).to be_valid
      end
      it 'user_idが空でなければ保存できる' do
        expect(@order).to be_valid
      end
      it 'item_idが空でなければ保存できる' do
        expect(@order).to be_valid
      end
      it '郵便番号が「3桁＋ハイフン＋4桁」の組み合わせであれば保存できる' do
        @order.post_code = '123-4560'
        expect(@order).to be_valid
      end
      it '都道府県が「---」以外かつ空でなければ保存できる' do
        @order.prefecture_id = 1
        expect(@order).to be_valid
      end
      it '市区町村が空でなければ保存できる' do
        @order.municipalities = '横浜市'
        expect(@order).to be_valid
      end
      it '番地が空でなければ保存できる' do
        @order.house_number = '旭区１２３'
        expect(@order).to be_valid
      end
      it '建物名が空でも保存できる' do
        @order.building_name = nil
        expect(@order).to be_valid
      end
      it '電話番号が11番桁以内かつハイフンなしであれば保存できる' do
        @order.telephone_number = 12_345_678_910
        expect(@order).to be_valid
      end
    end

    context '配送先情報の保存ができないとき' do
      it 'user_idが空だと保存できない' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できない' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号が空だと保存できないこと' do
        @order.post_code = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号にハイフンがないと保存できないこと' do
        @order.post_code = 1_234_567
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it '都道府県が「---」だと保存できないこと' do
        @order.prefecture_id = 0
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '都道府県が空だと保存できないこと' do
        @order.prefecture_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空だと保存できないこと' do
        @order.municipalities = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Municipalities can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @order.house_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @order.telephone_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Telephone number can't be blank")
      end
      it '電話番号にハイフンがあると保存できないこと' do
        @order.telephone_number = '123 - 1234 - 1234'
        @order.valid?
        expect(@order.errors.full_messages).to include('Telephone number is invalid')
      end
      it '電話番号が9桁以下では保存できないこと' do
        @order.telephone_number = 12_345_67
        @order.valid?
        expect(@order.errors.full_messages).to include('Telephone number is invalid')
      end
      it '電話番号が12桁以上あると保存できないこと' do
        @order.telephone_number = 12_345_678_910_123_111
        @order.valid?
        expect(@order.errors.full_messages).to include('Telephone number is invalid')
      end
      it 'トークンが空だと保存できないこと' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end