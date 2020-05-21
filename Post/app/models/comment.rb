class Comment < ApplicationRecord
	include Deletable

	belongs_to :article,  dependent: :destroy, counter_cache: true

  after_soft_destroy :decrement_counter_cache

  private

  def decrement_counter_cache
    association(:article).decrement_counters
  end
end
