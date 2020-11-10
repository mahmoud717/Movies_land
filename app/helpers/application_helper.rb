module ApplicationHelper
    def logged?
        session.key?("current_user") ? true : false
    end
end
