require 'open-uri'

class PreviewerController < ApplicationController
  def index
    @preview = Preview.last
  end

  def process_url
    url = params[:url]
    image_url = fetch_open_graph_image(url)

    Preview.create(url: url, image_url: image_url)

    redirect_to root_path
  end

  private

  def fetch_open_graph_image(url)
    doc = Nokogiri::HTML(open(url))
    image_tag = doc.at('meta[property="og:image"]')

    image_tag['content'] if image_tag
  rescue StandardError
    nil
  end
end
