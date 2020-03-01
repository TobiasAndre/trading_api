# frozen_string_literal: true

require "zip/zip"
require "find"
require "fileutils"

class Unzipper
  UnzippError = Class.new(StandardError)

  class << self
    def run(filename, unzip_dir)
      Zip::ZipFile.open(filename) do |zip_file|
        zip_file.each do |f|
          f_path = File.join(unzip_dir, f.name)
          FileUtils.mkdir_p(File.dirname(f_path))
          zip_file.extract(f, f_path) unless File.exist?(f_path)
        end
      end
    rescue Zip::Error
      raise UnzippError
    end
  end
end
