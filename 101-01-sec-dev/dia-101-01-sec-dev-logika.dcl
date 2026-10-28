///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_secondary_device_logika: dialog {label = "Адаптеры \"Логика\"";

:row {label="";
	:column {label=""; 
		:text {label="Модель"; }//text
		:list_box {label=""; key="txt-001"; width=10; height=20;}//list_box
	}//column

	:column {label=""; 
		:text {label="Описание"; }//text
		:list_box {label=""; key="txt-1001"; width=60; height=20;}//list_box
	}//column

	:column {label="";
		:text {label="Выбрано"; }//text
		:list_box {label=""; key="txt-901"; list=""; width=10; height=20; value= "0";}
	}//column
}//row

:row {label="";
	:button {label="Запомнить"; key="but1"; height=1;}
	:button {label="ПЭ"; key="but2"; height=1;}
	:button {label="СПЦФ"; key="but3"; height=1;}
	:button {label="ОВШ"; key="but4"; height=1;}
	ok_only;
}//row

}

