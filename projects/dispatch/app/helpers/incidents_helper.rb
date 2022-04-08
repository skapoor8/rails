module IncidentsHelper
    def sortable(column, title = nil, default = nil)
        title ||= column.titleize
        active ||= (column == params[:sort_by])

        direction_param = params[:sort_direction]

        if default && params[:sort_direction].blank?
            active = true;
            direction_param = "desc"
        end

        direction = (active && direction_param == "asc") ? "desc" : "asc"

        link_to :sort_by => column, :sort_direction => direction do
            if active
                direction_class = opposite(direction) + "ending"
            else
                direction_class = ""
            end
            (title + content_tag(:i, "", class: "sort " + direction_class + " icon")).html_safe
        end
    end

    def api_doc_menu_item
        link_to "API", "/api-docs", {:class => "item"}
    end

    def reported_incidents_link
        link_to 'My Reported Incidents', incidents_path(:current_tab => "reported"), {:class => "item", :id => "reported"}
    end

    def resolvable_incidents_link
        link_to 'My Resolvable Incidents', incidents_path(:current_tab => "resolvable"), {:class => "item", :id => "resolvable"}
    end

    def archives_link
        link_to 'Incident Archives', incidents_path(:current_tab => "archives"), {:class => "item", :id => "archives"}
    end

    def get_question_option(question_id, question_format, option_text) 
        case question_format
            when 3
                input = radio_and_label_tag(question_id, option_text)
            when 4
                input = checkbox_and_label_tag(question_id, option_text)

            else
        end
        input
    end

    private

    def opposite(direction)
        direction == "desc" ? "asc" : "desc"
    end

    def checkbox_and_label_tag(question_id, option_text)
        content_tag(:div, class: "ui checkbox") do 
            concat check_box_tag(question_id, option_text)
            concat label_tag(question_id, option_text.capitalize)
        end
    end

    def radio_and_label_tag(question_id, option_text)
        content_tag(:div, class: "ui radio checkbox") do 
            concat radio_button_tag(question_id, option_text)
            concat label_tag(question_id, option_text.capitalize)
        end
    end

end
