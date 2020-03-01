# frozen_string_literal: true

class FileDownloader
  DownloadError = Class.new(StandardError)
  class << self
    def download(filename)
      Down.download(filename)
    rescue Down::Error
      raise DownloadError
    end
  end
end
