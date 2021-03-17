module IncidentsHelper

    def show_apologizers(incident)
        if incident.apologized?(current_user)
            if incident.apology_users_count > 2
                "#{link_to "You", current_user} and #{@incident.apology_users_count-1} others apologize for this:"
            elsif incident.apology_users_count == 2
                "#{link_to "You", current_user} and 1 other apologize for this:"
            elsif incident.apology_users_count == 1
                "#{link_to "You", current_user} apologize for this:"
            end
        else
            if incident.apology_users_count > 3
                "#{link_to @incident.apologies.first.user.name, @incident.apologies.first.user} and #{@incident.apology_users_count-1} others apologize for this:"
            elsif incident.apology_users_count == 2
                "#{link_to @incident.apologies.first.user.name, @incident.apologies.first.user} and 1 other apologize for this:"
            elsif incident.apology_users_count == 1
                "#{link_to @incident.apologies.first.user.name, @incident.apologies.first.user} apologizes for this:"
            else
                "No one has apologized for this. Will you be first?."
            end
        end
    end
end
