class ActivityTimeline < ApplicationRecord
  belongs_to :activity

  enum history_status: [:quote_draft, :quote_issued, :pending_admin_approval, :pending_customer_approval, :ready_for_repair, \
    :repair_draft, :repair_done, :repair_pending_admin_approval, :ready_for_billing, :billed , :idle, :deleted]

end
