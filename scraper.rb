#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

ka = WikiData::Category.new( 'კატეგორია:საქართველოს VIII მოწვევის პარლამენტის წევრები', 'ka').member_titles
en = WikiData::Category.new( 'Category:Members of the Parliament of Georgia', 'en').member_titles

EveryPolitician::Wikidata.scrape_wikidata(names: { ka: ka, en: en })
