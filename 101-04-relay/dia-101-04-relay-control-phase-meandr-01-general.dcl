///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_04_relay_control_phase: dialog {label = "Контроль фаз, Меандр";

:row {label="";
  :column {label="";
    :text {label="Модель";}
    :list_box {key="txt-01"; list=""; width=20; height=9; value=0;}//list_box
  }//column
 
  :column {label="";
    :text {label="Uном.";}
    :list_box {key="txt-02"; list=""; width=16; height=9; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Исп.";}
    :list_box {key="txt-03"; list=""; width=10; height=9; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Артикул";}
    :list_box {key="txt-04"; list=""; width=16; height=9; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Монтаж";}
    :list_box {key="txt-05"; list=""; width=12; height=9; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Масса";}
    :list_box {key="txt-99"; list=""; width=5; height=9; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Описание";}
    :list_box {key="txt-900"; list=""; width=50; height=9; value=0;}//list_box
  }//column
}//row

:row {label="";
	:column {label="";
		:text {label="Выбрано"; }//text
		:list_box {label=""; key="txt-901"; list=""; width=50; height=7; value= "0";}
	}//column
}//row

:row {label="";
	:button {label="Запомнить"; key="but1"; height=1;}
	:button {label="Удалить"; key="but5"; height=1;}
	:button {label="ПЭ"; key="but2"; height=1;}
	:button {label="СПЦФ"; key="but3"; height=1;}
	:button {label="ОВШ"; key="but4"; height=1;}
	
	ok_only;
}//row
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
