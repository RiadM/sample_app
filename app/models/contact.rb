class Contact < MailForm::Base
	attribute :nom,			:validate => true
	attribute :email,		:validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
	attribute :message
	attribute :nickname,	:captcha => true


	# Déclare le header du email, accepte ce que ActionMailer accepts

	def headers
		{
			:subject => "Contact form",
			:to		 => "leseditionsuruk@gmail.com",
			:form 	 => %("#{nom}" <#{email}>)
		}
	end
end