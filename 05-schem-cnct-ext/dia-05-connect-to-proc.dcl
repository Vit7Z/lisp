///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_05_connect_to_proc: dialog {label = "ССВП. Детали присоединения к процессу";

:row {label="";
	:column {label=""; 
		:text {label="Тип присоединения"; }//text
		:list_box {label=""; key="txt-01"; list=""; width=24; height=20;}//list_box
	}//column

	:column {label=""; 
		:text {label="Обозначение"; }//text
		:list_box {label=""; key="txt-02"; list=""; width=20; height=20;}//list_box
	}//column

	:column {label="";
		:text {label="Назначение"; }//text
		:list_box {label=""; key="txt-03"; list=""; width=90; height=20;}
	}//column
}//row

:radio_button {label="Только текст и полка"; key="but-02"; height=1;}

:row {label="";
	:button {label="Выбрать"; key="but1"; height=1;}
	ok_only;
}//row

}// 
///////////////////////////////////////////////////////////////////////////////////////////////////////////

