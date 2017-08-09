module ApplicationHelper
    def full_title(string = "")
        basic_title = "Awesome Blog"
        if string.blank?
          basic_title
        else
          "#{string} | Awesome Blog"
        end
    end
end
