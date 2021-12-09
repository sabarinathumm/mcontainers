class InvoiceMailer < ApplicationMailer

	def send_invoice(invoice, url)
		@invoice = invoice
		@url = url
		mail(to: @invoice.email, subject: "Invoice")
	end
end
