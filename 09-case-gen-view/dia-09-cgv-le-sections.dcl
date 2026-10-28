dia_09_cgv_le: dialog {label = "Заголовки ПЭ  для ОВШ";

:row {
	:column {
		:text {label="Раздел";}
		:list_box {key="txt-01"; list=""; height=8; width=28;}//list_box
	}//column
	
	:column {
		:text {label="Что должен содержать";}
		:list_box {key="txt-02"; list=""; height=8; width=50;}//list_box
	}//column
}//row

:row {label="";
	ok_only;
}//row
}

