///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_01_gas_contamination_control_seitron: dialog {label = "";

:row {label="";
  :column {label="";
    :text {label="Газ";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=25; height=7; value=0;}//list_box
  }//column
 
  :column {label="";
    :text {label="Модель";}
    :text {label="";}
    :list_box {key="txt-02"; list=""; width=20; height=7; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="";}
    :text {label="";}
    :list_box {key="txt-03"; list=""; width=20; height=7; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="";}
    :text {label="";}
    :list_box {key="txt-04"; list=""; width=20; height=7; value=0; multiple_select=true;}//list_box
  }//column
 
  :column {label="";
    :text {label="Масса,";}
    :text {label="кг";}
    :list_box {key="txt-05"; list=""; width=5; height=7; value=0; multiple_select=true;}//list_box
  }//column
}//row

:row {label="";
	:column {label="";
		:text {label="Описание"; }//text
		:list_box {label=""; key="txt-06"; list=""; width=50; height=7; value= "0";}
	}//column
}//row


:row {label="";
	:column {label="";
		:text {label="Выбрано"; }//text
		:list_box {label=""; key="txt-901"; list=""; width=50; height=10; value= "0";}
	}//column
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
