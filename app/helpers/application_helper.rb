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
end
