module ApplicationHelper
    
    def markdown(text)
        options = {
            filter_html: true,
            hard_wrap: true,
            fenced_code_blocks: true
        }
        
        extensions = {
            autolink: true
        }
        
        renderer = Redcarpet::Render::HTML.new(options)
        markdown = Redcarpet::Markdown.new(renderer, extensions)
        
        markdown.render(text.html_safe)
    end
    
end
