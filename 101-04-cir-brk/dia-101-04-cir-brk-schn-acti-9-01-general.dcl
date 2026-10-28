///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_04_cir_brk_acti_9: dialog {label = "Schneider Electric Acti 9";

:row {label="";
  :column {label="";
    :text {label="Модель, кривая расцепителя,";}
    :text {label="кол. полюсов";}
    :list_box {key="txt-01"; list=""; width=25; height=20; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Iном.";}
    :text {label="А";}
    :list_box {key="txt-02"; list=""; width=6; height=20; value=0;}//list_box
  }//column
 
  :column {label="";
    :text {label="Артикул";}
    :text {label="";}
    :list_box {key="txt-03"; list=""; width=14; height=20; value=0;}//list_box
  }//column  

  :column {label="";
    :text {label="Масса,";}
    :text {label="кг";}
    :list_box {key="txt-99"; list=""; width=5; height=20; value=0;}//list_box
  }//column  

	:column {label="";
		:text {label="Выбрано"; }//text
		:text {label="";}
		:list_box {label=""; key="txt-901"; list=""; width=50; height=20; value= "0";}
	}//column

}//row

:row {label="";
	:list_box {label=""; key="txt-1001"; list=""; width=50; height=5; value= "0";}
}//row

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

///////////////////////////////////////////////////////////////////////////////////////////////////////////
