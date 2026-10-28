dia_100_le_auto: dialog {label = "Заголовки ПЭ";

:row {label="";
	:column {
		:text {label="По НТД";}
		:list_box {key="txt-01"; list=""; height=22; width=45;}//list_box
	}//column

	:column {
		:text {label="Разные";}
		:list_box {key="txt-02"; list=""; height=22; width=70;}//list_box
	}//column
}//row

:row {label="";
	ok_only;
}//row
}

