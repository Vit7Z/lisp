dia_101_spcf_auto: dialog {label = "Заголовки СПЦФ";

:row {label="";
	:column {
		:text {label="По НТД";}
		:list_box {key="txt-01"; list=""; height=22; width=46;}//list_box
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

