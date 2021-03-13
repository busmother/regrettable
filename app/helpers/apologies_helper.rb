module ApologiesHelper

    def show_forgives(apology)
        if apology.forgiven?(current_user)
            case apology.forgives_count
            when > 2
                "#{link_to "You", current_user} and #{@apology.forgives_count-1} others forgive this:"
            when == 2
                "#{link_to "You", current_user} and 1 other forgive this:"
            when == 1
                "#{link_to "You", current_user} forgive this:"
            else
                "No one forgives this yet - will you be the first?"
            end
        else
            case apology.forgives_count
            when > 2
                "#{link_to apology.first_forgive.name, apology.first_forgive}, and #{@apology.forgives_count-1} other forgive this:"
            when == 2
                "#{link_to apology.first_forgive.name, apology.first_forgive}, and 1 other forgive this:"
            when == 1
                "#{link_to apology.first_forgive.name, apology.first_forgive} forgive this:"
            when == 0
                "No one forgives this yet - will you be the first?"
            end
        end
    end
end
