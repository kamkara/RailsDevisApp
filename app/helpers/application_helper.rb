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
end
