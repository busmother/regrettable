module HomeHelper

    def all_users
        @users.each do |user|
            "<li> #{link_to user.name, user_path(user)} </li>"
        end
    end

    def all_incidents
        "all incidents"
    end

    def longest_apologies
        "longest apologies"
    end

    def newest_apologies
        "newest apologies"
    end

end
