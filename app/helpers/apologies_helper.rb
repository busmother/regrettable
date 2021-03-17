module ApologiesHelper

    def show_header(apology)
        "#{link_to apology.user.name, apology.user} #{link_to "apologises", apology} for #{link_to apology.incident.name, apology.incident}"
    end

    def show_forgives(apology)
        if apology.forgiven?(current_user)
            if apology.forgives_count > 2
                "#{link_to "You", current_user} and #{apology.forgives_count-1} others forgive this"
            elsif apology.forgives_count == 2
                "#{link_to "You", current_user} and 1 other forgive this"
            elsif apology.forgives_count == 1
                "#{link_to "You", current_user} forgive this"
            elsif apology.forgives_count == 0 && apology.user == current_user
                "No one forgives this yet"
            else
                "No one forgives this yet - will you be the first?"
            end
        else
            if apology.forgives_count > 2
                "#{link_to apology.first_forgive.name, apology.first_forgive} and #{apology.forgives_count-1} others forgive this"
            elsif apology.forgives_count == 2
                "#{link_to apology.first_forgive.name, apology.first_forgive} and 1 other forgive this"
            elsif apology.forgives_count == 1
                "#{link_to apology.first_forgive.name, apology.first_forgive} forgive this"
            elsif apology.forgives_count == 0 && apology.user == current_user
                "No one forgives this yet"
            else
                "No one forgives this yet - will you be the first?"
            end
        end
    end

    # def show_forgive(apology)
    #     if apology.forgiven?(current_user)
    #         "#{button_to 'Unforgive', forgiveness_path(apology), method: 'delete'}"
    #     else
    #         "#{button_to 'Forgive', forgiveness_path(apology), method: 'put'}"
    #     end
    # end

    # def show_edit_or_forgive(apology)
    #     if apology.user == current_user
    #         "#{button_to "Edit your apology", edit_apology_path(apology)} <br> #{button_to "Remove apology", apology_path(apology), method: 'delete'}"
    #     else
    #         show_forgive(apology)
    #     end
    # end

    def show_apology_buttons(apology)
        if apology.user == current_user
            "#{button_to "Edit your apology", edit_apology_path(apology)} <br> #{button_to "Remove apology", apology_path(apology), method: 'delete'}"
        else
            if apology.forgiven?(current_user)
                "#{button_to 'Unforgive', forgiveness_path(apology), method: 'delete'}"
            else
                "#{button_to 'Forgive', forgiveness_path(apology), method: 'put'}"
            end
        end
    end

    def show_remove(apology)
        if apology.user == current_user
            "#{link_to "Remove", destroy_apology_path(apology)}"
        end
    end

    def order_apologies_newest(apologies)
        Apology.newest_apologies.each do |apology|
            "<li> #{render 'apologies/apology', locals: {apology: @apology, user: @apology.user}} </li>"
        end
    end

end
