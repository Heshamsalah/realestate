require 'rails_helper'
# require 'spec_helper'
describe Api::V1::RealestatetransactionsController, :type => :controller do
    context "Testing RealEstateTransactions API" do
        before(:each) do
            request.accept = "application/json"
        end

        it "Should retrieve all data paginated" do
            get :index, params: {:page => '1', :limit => '10'}
            expect(response).to have_http_status(:ok)
        end

        it "Sould create a new record" do
            new_record = {
                :street => "123 example st.",
                :city => "example city",
                :beds => "2",
                :baths => "1",
                :price => "20000",
                :longtude => "32.222",
                :latitude => "12.2222",
                :state => "CA",
                :sq_ft => "700",
                :zip => "25468",
                :sale_date => "12/12/2012"
            }
            post :create, params: {transaction: new_record}
            rec = Realestatetransaction.where(new_record).first
            expect(response).to have_http_status(:ok)
            expect(rec.city).to eq(new_record[:city])
        end

        it "Should delete a record" do
            rec = Realestatetransaction.first
            id = rec.id
            delete :destroy, params: {id: id}
            rec = Realestatetransaction.where(id: id).first.present?
            expect(response).to have_http_status(:ok)
            expect(rec).to be(false)
        end

        it "Should update some record" do
            rec = Realestatetransaction.first
            edits = {
                :street => "222 ex st.",
                :city => "hello world!",
            }
            patch :update, params: {id: rec.id, transaction: edits}
            expect(response).to have_http_status(:ok)
            expect(JSON.parse(response.body)["city"]).to eq(edits[:city])
            expect(JSON.parse(response.body)["street"]).to eq(edits[:street])
        end

        it "Should search categories, price_ranges and sq_ft_ranges" do
            params = {
                page: '1',
                limit: '10',
                search: {
                    category: 'residential',
                    price_range: '0-200000',
                    sq_ft_range: '0-2000'
                }
            }
            get :search, params:
            expect(response).to have_http_status(:ok)
        end
    end
end
