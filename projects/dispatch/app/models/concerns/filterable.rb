module Filterable
    extend ActiveSupport::Concern

    module ClassMethods
        def filter(filtering_params)
            results = self.where(nil)
            filtering_params.each do |key, value|
                results = results.public_send(key, value) if value.present?
            end
            results
        end

        def sortBy(sorting_params)
            sort_by = sorting_params[:sort_by]
            sort_direction = sorting_params[:sort_direction]
            results = self.order(start_date: :desc)
            if sort_by.present? && sort_direction.present?
                results = self.order(sort_by + " " + sort_direction)
            end
            results
        end
    end
end