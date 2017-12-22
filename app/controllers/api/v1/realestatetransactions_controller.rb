module Api
  module V1
    class RealestatetransactionsController < ApplicationController
      before_action :set_limit, :set_page, only: [:index]
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
        @transaction = Realestatetransaction.where(id: params[:id])
      end

      def new
      end

      def create
      end

      def update
        @transaction = Realestatetransaction.where(id: params[:id]).first
        if @transaction.update_attributes(transaction_params)
          render json: @transaction, status: :ok
        else
          render json: {error: "Updating Faild!"}, status: :unprocessable_entity
        end
      end

      def delete
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
          params.permit(:city)
        end
        
    end
  end
end
