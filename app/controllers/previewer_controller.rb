class PreviewerController < ApplicationController
  def index
    @preview = Preview.last
  end

  def process_url
    url = params[:url]

    # Enqueue the job to fetch the Open Graph image asynchronously
    UrlProcessingJob.perform_later(url)

    redirect_to root_path
  end
end
