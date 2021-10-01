class Contact::Filter

    def filter(scope, query_params)
      if query_params[:sName].present?
        scope = scope.where("name ILIKE :sName OR email ILIKE :sName OR number ILIKE :sName", sName: "%#{query_params[:sName]}%")
      end

      scope
    end
  
  end