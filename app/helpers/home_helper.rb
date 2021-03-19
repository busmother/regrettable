module HomeHelper

    def all_users
        @users.each do |user|
            "#{link_to user.name, user} "
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
