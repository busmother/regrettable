module ApologiesHelper

    def show_forgives(apology)
        if apology.forgiven?(current_user)
            if apology.forgives_count > 2
                "#{link_to "You", current_user} and #{@apology.forgives_count-1} others forgive this"
            elsif apology.forgives_count == 2
                "#{link_to "You", current_user} and 1 other forgive this"
            elsif apology.forgives_count == 1
                "#{link_to "You", current_user} forgive this"
            else
                "No one forgives this yet - will you be the first?"
            end
        else
            if apology.forgives_count > 2
                "#{link_to apology.first_forgive.name, apology.first_forgive} and #{@apology.forgives_count-1} others forgive this"
            elsif apology.forgives_count == 2
                "#{link_to apology.first_forgive.name, apology.first_forgive} and 1 other forgive this"
            elsif apology.forgives_count == 1
                "#{link_to apology.first_forgive.name, apology.first_forgive} forgive this"
            else
                "No one forgives this yet - will you be the first?"
            end
        end
    end

    def show_forgive(apology)
        if apology.forgiven?(current_user)
            "#{link_to 'Unforgive', forgiveness_path(apology), method: 'delete'}"
        else
            "#{link_to 'Forgive', forgiveness_path(apology), method: 'put'}"
        end
    end

    def show_header(apology)
        "#{link_to apology.user.name, apology.user} #{link_to "apologises", apology} for #{link_to apology.incident.name, apology.incident}"
    end

    def show_edit_or_forgive(apology)
        if apology.user == current_user
            "#{link_to "Edit your apology", edit_apology_path(apology)}, #{link_to "Remove apology", delete_apology_path(apology)}"
        else
            show_forgive(apology)
        end
    end

    def show_remove(apology)
        if apology.user == current_user
            "#{link_to "Remove", destroy_apology_path(apology)}"
        end
    end

end
