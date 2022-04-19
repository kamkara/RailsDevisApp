module ApplicationHelper
    #Onglet title
    def title
       title_base = "Lnclass Devis Platform" 
       if @title.nil?
         title_base
       else
       "#{@title} | #{title_base}"
       end
    end

    #flash message with turbo_stream
    def render_turbo_stream_flash_messages
      turbo_stream.prepend "flash", partial: "layouts/flash" 
    end

    def form_error_notification(object)
    if object.errors.any?
      tag.div class: "error-message" do
        object.errors.full_messages.to_sentence.capitalize
      end
    end
  end
end
