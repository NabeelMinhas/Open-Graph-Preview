class PreviewerController < ApplicationController
  def index; end

  def process_url
    url = params[:url]

    if valid_url?(url)
      UrlProcessingJob.perform_later(url)
    else
      flash[:error] = "Invalid URL format"
      redirect_to root_path
    end
  end

  private

  def valid_url?(url)
    uri = URI.parse(url)
    uri.is_a?(URI::HTTP) && !uri.host.nil?
  rescue URI::InvalidURIError
    false
  end
end
