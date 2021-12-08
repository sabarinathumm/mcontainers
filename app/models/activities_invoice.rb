class ActivitiesInvoice < ApplicationRecord

    include Filterable
    include Sortable

    belongs_to :activity
    belongs_to :invoice
end