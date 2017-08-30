module ApplicationHelper

	#Retourne un titre complet selon les pages
	def full_title(page_title = '')				#Method def, optional arg
		base_title = "Ruby on Rails"			# Variable assignement
		if page_title.empty?					# Boolean test
			base_title							# Implicit return
		else
			page_title + " | " + base_title		# String Concatenation
		end
	end
end
