class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def render_to_pdf
    search_wards = Array['.navbar-header','ul.nav.navbar-nav.navbar-right','.sns-button','br']
    meta = '<meta http-equiv="content-type" content="text/html; charset=utf-8" />'
    body = render_to_string formats: :html
    doc = Nokogiri::HTML(body)

    # Remove not need tags
    search_wards.each do |ward|
      doc.css(ward).remove
    end

    # Add .pdf-contaier
    nodes_container = doc.css '.container'
    nodes_container.wrap("<div id='pdf-container'></div>")

    html = meta + doc.to_html
    pdf  = WickedPdf.new.pdf_from_string(html)
  end
end
