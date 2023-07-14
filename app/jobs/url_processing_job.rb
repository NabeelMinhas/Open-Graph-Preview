require 'open-uri'

class UrlProcessingJob < ApplicationJob
  queue_as :default

  def perform(url)
    doc = Nokogiri::HTML(open(url))
    image_tag = doc.at('meta[property="og:image"]')

    image_url = image_tag['content'] if image_tag

    Preview.create(url: url, image_url: image_url)
  rescue StandardError
    nil
  end
end
