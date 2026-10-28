///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_08_valvate_block_metran: dialog {label = "Клапанные блоки \"Метран\"";

:row {label="";
  :column {
    :text {label="Серия";}
    :text {label="";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=6; height=6; value=0;}//list_box
  }//column

  :column {
    :text {label="Исполнение";}
    :text {label="";}
    :text {label="";}
    :list_box {key="txt-02"; list=""; width=32; height=6; value=0;}//list_box
  }//column

  :column {
    :text {label="Кол.";}
    :text {label="вент.";}
    :text {label="";}
    :list_box {key="txt-03"; list=""; width=5; height=6; value=0;}//list_box
  }//column

  :column {
    :text {label="Материал";}
    :text {label="корпуса";}
    :text {label="";}
    :list_box {key="txt-04"; list=""; width=14; height=6; value=0;}//list_box
  }//column

  :column {
    :text {label="Соединение";}
    :text {label="с процессом";}
    :text {label="";}
    :list_box {key="txt-05"; list=""; width=20; height=6; value=0;}//list_box
  }//column

  :column {
    :text {label="Материал уплотнит. колец,";}
    :text {label="Материал уплотнен. вентиля,";}
    :text {label="Температурный предел";}
    :list_box {key="txt-06"; list=""; width=46; height=6; value=0;}//list_box
  }//column

  :column {
    :text {label="Тип датчика";}
    :text {label="";}
    :text {label="";}
    :list_box {key="txt-07"; list=""; width=20; height=6; value=0;}//list_box
  }//column
}//row

:row {label="";

  :column {
  	:text {label="Кронштейн";}
    :text {label="";}
    :list_box {key="txt-08"; width=20; height=6; value=0;}//list_box
  }//column

  :column {
  	:text {label="Монтажные части";}
    :text {label="";}
    :list_box {key="txt-09"; width=56; height=6; value=0;}//list_box
  }//column

  :column {
  	:text {label="Материал монтажных";}
    :text {label="частей";}
    :list_box {key="txt-10"; width=16; height=6; value=0;}//list_box
  }//column

  :column {
  	:text {label="Болт";}
    :text {label="";}
    :list_box {key="txt-11"; width=24; height=6; value=0;}//list_box
  }//column

  :column {
  	:text {label="Кисло-";}
    :text {label="род";}
    :list_box {key="txt-12"; width=10; height=6; value=0;}//list_box
  }//column

  :column {
  	:text {label="Гидравлическая";}
    :text {label="схема";}
    :list_box {key="txt-13"; width=20; height=6; value=0;}//list_box
  }//column
}//row

:row {label="";
	:text {label=""; key="ptxt-01"; height=2; value="";}
}//row

:column {label="";
	:text {label="Выбрано"; }//text
	:list_box {label=""; key="txt-901"; list=""; height=10; value= "0";}
}//column

:row {label="";
	:button {label="Запомнить"; key="but1"; height=1;}
	:button {label="ПЭ"; key="but2"; height=1;}
	:button {label="СПЦФ"; key="but3"; height=1;}
	:button {label="Удалить"; key="but5"; height=1;}
	:button {label="Вверх"; key="but6"; height=1;}
	ok_only;
}//row
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
