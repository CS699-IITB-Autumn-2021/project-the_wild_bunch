class param_matcher:
	def __init__(self, list_str):
		print("child")
		self.curr = list_str
		# print("::::::"+str(list_str))
		self.child_list = self.children(list_str)
		# print(list_str[child_list[0][0]:child_list[0][1]])
		# print(list_str[child_list[0][0]:child_list[0][0]+10])
		self.children_l = []
		for i in self.child_list:
			new_child=param_matcher(list_str[i[0]:i[1]+1])
			self.children_l.append(new_child)
			
	def children(self, str_curr):
		children = 0
		count_bracket = 0
		
		bracket_loc_indices = []
		opening_closing_brackets = []
		children_location = []

		for i in range(0,len(str_curr)):
			#print(i, str_curr[i], len(str_curr), count_bracket)
			if str_curr[i]=="[":
				count_bracket = count_bracket+1
				opening_closing_brackets.append(i+1)
			
			elif str_curr[i] == "]":
				
				count_bracket = count_bracket-1
				opening_last_loc = opening_closing_brackets.pop()
				closing_last_loc = i-1

				bracket_loc_indices.append((opening_last_loc,closing_last_loc))



				if count_bracket<0:
					print("ERROR")
					exit()

				if count_bracket == 0:
					children = children + 1
					children_location.append((opening_last_loc,closing_last_loc))
		#if count_bracket<0:
			
		return children_location

