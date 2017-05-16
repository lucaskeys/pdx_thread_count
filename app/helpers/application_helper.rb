module ApplicationHelper
		def alerts
		alert = (flash[:alert] || flash[:error] || flash[:notice])
		if alert 
			alert_generator alert
		end
	end

	def alert_generator message
		js add_gritter(message, title: "Notice:", sticky: false)
	end
end
