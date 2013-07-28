module ApplicationHelper
	def login_nav
		if @auth.present?
			link_to('Logout', logout_path, :method => :get, :class => 'button alert')
		else
			link_to('Login', login_path, :class => 'button success radius')
		end
	end
end
