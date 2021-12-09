class InvoiceMailer < ApplicationMailer

	def send_invoice(invoice)
		@name = invoice.customer.full_name
		@email = invoice.customer.email
		@invoice_number = invoice.invoice_number
		mail(to: @email, subject: "Invoice")
	end
end
