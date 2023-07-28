require 'open-uri'

class UrlProcessingJob < ApplicationJob
  queue_as :default

  def perform(url)
    preview = Preview.find_by(url: url)

    unless preview
      doc = Nokogiri::HTML(open(url))
      image_tag = doc.at('meta[property="og:image"]')
      image_url = image_tag['content'] if image_tag
      preview = Preview.create(url: url, image_url: image_url)
    end
    ActionCable.server.broadcast("preview_channel", preview)
  rescue StandardError
    nil
  end
end
