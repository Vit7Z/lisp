///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_controllers_elsi_tmk: dialog {label = "Контроллеры \"ЭлеСи\"";

:row {label="";  
  :column {label="";
    :text {label="Тип модуля";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=35; height=15; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Обозначение";}
    :text {label="";}
    :list_box {key="txt-02"; list=""; width=20; height=15; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Номер для";}
    :text {label="заказа";}
    :list_box {key="txt-03"; list=""; width=15; height=15; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Описание";}
    :text {label="";}
    :list_box {key="txt-04"; list=""; width=120; height=15; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Масса,";}
    :text {label="кг";}
    :list_box {key="txt-99"; list=""; width=6; height=15; value=0;}//list_box
  }//column
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
