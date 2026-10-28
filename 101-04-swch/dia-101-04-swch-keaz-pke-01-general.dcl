///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_04_keaz_pke: dialog {label = "Пост кнопочный ПКЕ";

:row {label=""; 
  :column {label="";
    :text {label="Серия";}
    :text {label="";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=10; height=10; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Артикул";}
    :text {label="";}
    :text {label="";}
    :list_box {key="txt-02"; list=""; width=36; height=10; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Кол.";}
    :text {label="толка-";}
    :text {label="телей";}
    :list_box {key="txt-03"; list=""; width=10; height=10; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Климатич.";}
    :text {label="исполнение";}
    :text {label="";}
    :list_box {key="txt-04"; list=""; width=20; height=10; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="IP по ГОСТ";}
    :text {label="14255";}
    :text {label="толкат./контакт.";}
    :list_box {key="txt-05"; list=""; width=15; height=10; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Упр. элемент";}
    :text {label="";}
    :text {label="";}
    :list_box {key="txt-06"; list=""; width=20; height=10; value=0;}//list_box
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
