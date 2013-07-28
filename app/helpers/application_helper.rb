module ApplicationHelper
	def login_nav
		if @auth.present?
			link_to('Logout', logout_path, :method => :get, :class => 'small button alert radius')
		else
			link_to('Login', login_path, :class => 'small button success radius')
		end
	end
end
