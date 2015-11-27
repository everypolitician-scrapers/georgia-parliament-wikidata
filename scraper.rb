#!/bin/env ruby
# encoding: utf-8

require 'scraperwiki'
require 'wikidata/fetcher'
require 'pry'
require 'rest-client'

@pages = [
  'კატეგორია:საქართველოს_მე-8_მოწვევის_პარლამენტის_წევრები',
]

ids = @pages.map { |c| WikiData::Category.new(c, 'ka').wikidata_ids }.flatten.uniq
ids.each_with_index do |id, i|
  puts i if (i % 50).zero?
  data = WikiData::Fetcher.new(id: id).data('ka') or next
  ScraperWiki.save_sqlite([:id], data) rescue binding.pry
end
warn RestClient.post ENV['MORPH_REBUILDER_URL'], {} if ENV['MORPH_REBUILDER_URL']
