class HostsStatusHistory < ApplicationRecord
  belongs_to :host

  validates_uniqueness_of :host_id, if: :open?
  enum status: { open: 0, closed: 1 }
end
