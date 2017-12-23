class Realestatetransaction < ApplicationRecord
    scope :price_range, -> (price_range_low, price_range_high) {where("price > ? AND price < ?", price_range_low, price_range_high)}
    scope :sq_ft_range, -> (sq_ft_range_low, sq_ft_range_high) {where("sq_ft > ? AND sq_ft < ?", sq_ft_range_low, sq_ft_range_high)}
    
    def self.search(search_params, limit, page)
        # byebug
        if search_params[:category].present?
            transaction = where(category: search_params[:category])
        end
        if search_params[:price_range].present?
            price_range_low = search_params[:price_range].split('-').first.to_i
            price_range_high = search_params[:price_range].split('-').last.to_i
            if transaction.present?
                transaction = transaction.price_range(price_range_low, price_range_high)
            else
                transaction = self.price_range(price_range_low, price_range_high)
            end
        end
        if search_params[:sq_ft_range].present? && !transaction.nil?
            sq_ft_range_low = search_params[:sq_ft_range].split('-').first.to_i
            sq_ft_range_high = search_params[:sq_ft_range].split('-').last.to_i
            if transaction.present?
                transaction = transaction.sq_ft_range(sq_ft_range_low, sq_ft_range_high)
            else
                transaction = self.sq_ft_range(sq_ft_range_low, sq_ft_range_high)
            end
        end
        transaction.offset(limit.to_i * page.to_i).limit(limit.to_i) if !transaction.nil?
    end
end
