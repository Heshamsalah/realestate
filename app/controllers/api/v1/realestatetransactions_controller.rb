module Api
  module V1
    class RealestatetransactionsController < ApplicationController
      before_action :set_limit, :set_page, only: [:index, :search]
      def index
        @transactions = Realestatetransaction.limit(@limit.to_i).offset(@page.to_i * @limit.to_i)
        render :index, status: :ok
      end

      def show
        @transaction = Realestatetransaction.where(id: params[:id]).first
        if @transaction.present?
          render json: @transaction, status: :ok
        else
          render json: {error: "404 Not Found"}, status: :not_found
        end
      end

      def edit
      end

      def new
      end

      def create
        @transaction = Realestatetransaction.new
        if @transaction.update_attributes(transaction_params)
          render json: @transaction, status: :ok
        else
          render json: {error: "Something went wrong"}, status: 500
        end
      end

      def update
        @transaction = Realestatetransaction.where(id: params[:id]).first
        if @transaction.update_attributes(transaction_params)
          render json: @transaction, status: :ok
        else
          render json: {error: "Updating Faild!"}, status: :unprocessable_entity
        end
      end

      def destroy
        if Realestatetransaction.destroy(params[:id])
          render json: {state: "Transaction #{params[:id]} Deleted Successfully!"}, status: :ok
        else
          render json: {error: "404 Not Found"}, status: :not_found
        end
      end

      def search
        @transactions = Realestatetransaction.search(search_params, @limit, @page)
        if @transactions.present?
          render json: @transactions, status: :ok
        else
          render json: {error: "Couldn't find any records"}, status: :not_found
        end
      end

      private
        def set_limit
          p = params.permit(:limit)
          @limit = p[:limit] || 10
        end

        def set_page
          p = params.permit(:page)
          @page = p[:page] || 1
        end

        def transaction_params
          params.require(:transaction)
          .permit(:street, :city, :beds, :baths, :price, :longtude, :latitude, :state, :sq_ft, :zip, :sale_date)
        end

        def search_params
          params.require(:search).permit(:category, :price_range, :sq_ft_range)
        end
        
    end
  end
end
