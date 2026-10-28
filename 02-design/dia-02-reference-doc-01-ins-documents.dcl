dia_02_reference_doc_01_ins_documents: dialog {label = "Ссылочные документы";

:row {label="";
	:column {label="";
		:list_box {label=""; key="txt-01"; list=""; width=10; height=7;}
	}//column
}//row

:row {label="";
	:column {label="";
		:list_box {label=""; key="txt-02"; list=""; width=26; height=15; multiple_select=true;}
	}//column

	:column {label="";
		:list_box {label=""; key="txt-03"; list=""; width=160; height=15; multiple_select=true;}
	}//column
}//row

:row {label="";
	:button {label="Запомнить"; key="but1"; height=1;}
	:button {label="Печать"; key="but2"; height=1;}
	:button {label="Только текст"; key="but3"; height=1;}
	cancel_button;
}//row

:row {label="";
	:column {label="";
		:text {label="Выбрано"; }//text
		:list_box {label=""; key="txt-901"; list=""; width=50; height=10; value= "0";}
	}//column
}//row

:row {label="";
	:button {label="Удалить"; key="but4"; height=1;}
}//row

}
