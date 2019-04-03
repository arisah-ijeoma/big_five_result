#!/usr/bin/env ruby

require './big_five_results_text_serializer'
require './big_five_results_poster'


big_five_results = BigFiveResultsTextSerializer.new('big_five_result.txt').to_h
poster = BigFiveResultsPoster.new(big_five_results)

print poster.poster
