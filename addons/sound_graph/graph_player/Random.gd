class_name Random extends PlayerResource

func execute():
	if !descendants: return
	descendants.pick_random().execute()
