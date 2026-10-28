///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_01_secondary_device_e1842s: dialog {label = "";

:row {label="";
	:column {label=""; 
		:text {label="Модель (Тип)"; }//text
		:list_box {label=""; key="txt-01"; width=20; height=5;}//list_box
	}//column

	:column {label=""; 
		:text {label="Описание"; }//text
		:list_box {label=""; key="txt-02"; width=50; height=5;}//list_box
	}//column
}//row

:column {label="";
	:text {label="Выбрано"; }//text
	:list_box {label=""; key="txt-901"; list=""; width=10; height=5; value= "0";}
}//column

:row {label="";
	:button {label="Запомнить"; key="but1"; height=1;}
	:button {label="ПЭ"; key="but2"; height=1;}
	:button {label="СПЦФ"; key="but3"; height=1;}
	:button {label="ОВШ"; key="but4"; height=1;}
	:button {label="Удалить"; key="but5"; height=1;}
	:button {label="Вверх"; key="but6"; height=1;}
	ok_only;
}//row

}

