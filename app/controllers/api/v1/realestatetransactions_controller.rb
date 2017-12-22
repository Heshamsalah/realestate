module Api
  module V1
    class RealestatetransactionsController < ApplicationController
      before_action :set_limit, :set_page, only: [:index]
      def index
        @transactions = Realestatetransaction.limit(@limit.to_i).offset(@page.to_i * @limit.to_i)
        render :index, status: :ok
      end

      def show
      end

      def edit
      end

      def new
      end

      def create
      end

      def update
      end

      def delete
      end
      private
        def set_limit
          @limit = params[:limit] || 10
        end

        def set_page
          @page = params[:page] || 1
        end
    end
  end
end
