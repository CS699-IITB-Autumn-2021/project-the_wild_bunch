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
	

	def pretty_print(self, file_name):
		to_construct = ""
		tab_chars = 0
		is_prev = 0
		quotes_open = 0

		for i in range(0,len(self.curr)):
			
			if self.curr[i] == "[":
				to_construct = to_construct + "\n"
				for tabs in range(0,(tab_chars)):
					to_construct = to_construct + " "
				to_construct = to_construct + self.curr[i]
				tab_chars = tab_chars + 1
				is_prev = 0

			elif self.curr[i] == "]":
				if is_prev==0:
					to_construct = to_construct + self.curr[i]
					# to_construct = to_construct + "\n"
					tab_chars = tab_chars - 1
					is_prev=1
				else:
					tab_chars = tab_chars - 1
					to_construct = to_construct + "\n"
					for tabs in range(0,(tab_chars)):
						to_construct = to_construct + " "
					to_construct = to_construct + self.curr[i]
			else:
				to_construct = to_construct + self.curr[i]
		


	def rem_brackets(self, file_name):
		to_construct = ""
		tab_chars = 0
		is_prev = 0

		for i in range(0,len(self.curr)):
			
			if self.curr[i] == "[":
				to_construct = to_construct + "\n"
				for tabs in range(0,(tab_chars)):
					to_construct = to_construct + " "
				to_construct = to_construct + self.curr[i]
				tab_chars = tab_chars + 1
				is_prev = 0

			elif self.curr[i] == "]":
				if is_prev==0:
					to_construct = to_construct + self.curr[i]
					# to_construct = to_construct + "\n"
					tab_chars = tab_chars - 1
					is_prev=1
				else:
					tab_chars = tab_chars - 1
					to_construct = to_construct + "\n"
					for tabs in range(0,(tab_chars)):
						to_construct = to_construct + " "
					to_construct = to_construct + self.curr[i]

					
		with open(file_name, "w") as f:
			f.write(to_construct)
		return to_construct
		
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

