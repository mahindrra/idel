module ApplicationHelper
	def print_user_name_with_style(user)
		profile = Porfile.where(user_id:user.id).first
		full_name = user.get_full_name
		style_name = ''
		if profile.present?
			lds = profile.learner_dimension_scale
			if lds.present?
				style_name = "(#{lds.learner_style.name})"
			end	
		end
		return "#{full_name} #{style_name}"
	end	
end
