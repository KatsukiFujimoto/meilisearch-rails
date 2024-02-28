require 'support/active_record_schema'

ar_schema.create_table :movies do |t|
  t.string :title
end

class Movie < ActiveRecord::Base
  include MeiliSearch::Rails

  meilisearch index_uid: safe_index_uid('Movie') do
    pagination max_total_hits: 5
    typo_tolerance enabled: false
  end
end

