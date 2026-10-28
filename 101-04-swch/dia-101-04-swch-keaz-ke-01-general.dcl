///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_04_keaz_ke: dialog {label = "Выключатель кнопочный КЕ";

:row {label=""; 
  :column {label="";
    :text {label="Серия";}
    :text {label="";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=10; height=10; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Исп.";}
    :text {label="";}
    :text {label="";}
    :list_box {key="txt-02"; list=""; width=10; height=10; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Тип";}
    :text {label="контак-";}
    :text {label="тов";}
    :list_box {key="txt-03"; list=""; width=12; height=10; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Климатич.";}
    :text {label="исполнение";}
    :text {label="и IP";}
    :list_box {key="txt-04"; list=""; width=20; height=10; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Цвет";}
    :text {label="толка-";}
    :text {label="теля";}
    :list_box {key="txt-05"; list=""; width=10; height=10; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Масса,";}
    :text {label="кг";}
    :text {label="";}
    :list_box {key="txt-99"; list=""; width=10; height=10; value=0;}//list_box
  }//column
}//row

:row {label="";
	:list_box {key="txt-900"; list=""; height=5; value=0;}//list_box
}//row

:column {label="";
	:text {label="Выбрано"; }//text
	:list_box {label=""; key="txt-901"; list=""; width=50; height=10; value= "0";}
}//column


:row {label="";
	:button {label="Запомнить"; key="but1"; height=1;}
	:button {label="ПЭ"; key="but2"; height=1;}
	:button {label="СПЦФ"; key="but3"; height=1;}
	:button {label="ОВШ"; key="but4"; height=1;}
	ok_only;
}//row
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
