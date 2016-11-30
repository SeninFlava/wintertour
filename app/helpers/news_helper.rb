module NewsHelper
	
	def next_row_num_news(news)
		if news.id.nil?
			if News.all.count == 0
				return 1
			else
				News.all.order(row_num: :desc).first.row_num+1
			end
		else 
			news.row_num
		end
	end

end
