dia_03_tchn_rqrmnts: dialog {label = "Технические требования";

:row {label="";  
  :column {label="";
    :text {label="Текст";}
    :list_box {key="txt-01"; list=""; width=150; height=15; value=0; multiple_select=true;}//list_box
  }//column
}//row

:row {label="";
	:column {label="";
		:text {label="Выбрано"; }//text
		:list_box {label=""; key="txt-901"; list=""; width=50; height=10; value= "0";}
	}//column
}//row

:row {label="";
	:button {label="Запомнить"; key="but-01"; height=1;}
	:button {label="Вставить"; key="but-02"; height=1;}
	:button {label="Удалить"; key="but-05"; height=1; is_enabled=false;}
	:button {label="Вверх"; key="but-06"; height=1;}
	ok_cancel;
}//row

}
