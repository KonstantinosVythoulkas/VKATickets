module CommentsHelper

    def submit_comment_button
        content_tag(:button, class: "btn btn-sm btn-primary", id: "send_button") do
            content_tag(:i, class: "bi bi-arrow-right-square") do
            end
        end  
    end


end