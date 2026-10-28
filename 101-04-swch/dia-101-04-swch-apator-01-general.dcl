///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_04_swtch_apator: dialog {label = "";

:row {label="";
  :column {label="";
    :text {label="Модель";}
    :text {label="";}
    :list_box {key="txt-001"; list=""; width=10; height=7; value=0;}//list_box
  }//column
  
  :column {label="";
    :text {label="Описание"; key="ptxt-011";}
    :text {label="";}
    :list_box {key="txt-002"; list=""; width=45; height=7; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Iном, А";}
    :text {label="";}
    :list_box {key="txt-003"; list=""; width=10; height=7; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Кол.";}
    :text {label="полюсов";}
    :list_box {key="txt-004"; list=""; width=10; height=7; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="№";}
    :text {label="схемы";}
    :list_box {key="txt-005"; list=""; width=10; height=7; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Исполнение";}
    :text {label="";}
    :list_box {key="txt-006"; list=""; width=40; height=7; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Рукоятка";}
    :text {label="";}
    :list_box {key="txt-007"; list=""; width=10; height=7; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Цвет";}
    :text {label="рукоятки";}
    :list_box {key="txt-008"; list=""; width=14; height=7; value=0;}//list_box
  }//column
}//row

:row {label="";
  :column {label="";
    :text {label="Спец. опции";}
    :list_box {key="txt-009"; list=""; width=90; height=6; value=0;}//list_box
  }//column

}//row

:column {label="";
		:text {label="Выбрано"; }//text
		:list_box {label=""; key="txt-901"; list=""; width=50; height=7; value= "0";}
}//column

:row {label="";
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
