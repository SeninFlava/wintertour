module NewsHelper
	
	def next_row_num_news
		if News.all.count == 0
			return 1
		else
			News.all.order(row_num: :desc).first.row_num+1
		end
	end

end
