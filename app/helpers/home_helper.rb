module HomeHelper

    def show_home #redundant
        if current_user != nil
            "<h3> Newest apologies </h3>"
            "#{render 'apologies/index'}"
        else
            ""
        end
    end

end
