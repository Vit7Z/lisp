dia_03_tech_req: dialog {label = "Технические требования";

:row {label="";  
  :column {label="";
    :text {label="Текст";}
    :list_box {key="txt-01"; list=""; width=170; height=15; value=0; multiple_select=true;}//list_box
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
	:button {label="Вставить Нов"; key="but-02"; height=1;}
	:button {label="Вставить в Сущ"; key="but-03"; height=1;}
	:button {label="Заменить Сущ"; key="but-04"; height=1;}
	:button {label="Удалить"; key="but-05"; height=1;}
	:button {label="Вверх"; key="but-06"; height=1;}
	ok_only;
}//row

}
