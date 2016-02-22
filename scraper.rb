#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

names = WikiData::Category.new( 'კატეგორია:საქართველოს_მე-8_მოწვევის_პარლამენტის_წევრები', 'ka').member_titles
EveryPolitician::Wikidata.scrape_wikidata(names: { ka: names }, output: false)
warn EveryPolitician::Wikidata.notify_rebuilder
