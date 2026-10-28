///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_01_secondary_device_trm12: dialog {label = "ТРМ12";

:row {label="";
  :column {
    :text {label="Вход";}
    :list_box {key="txt-01"; list=""; width=15; height=7;}//list_box
  }//column

  :column {
    :text {label="Выход 1, 2"; key="ptxt-041";}
    :list_box {key="txt-02"; list=""; width=40; height=7; }//list_box
  }//column

  :column {
    :text {label="Исполнение"; key="ptxt-061";}
    :list_box {key="txt-03"; list=""; width=30; height=7; }//list_box
  }//column

  :column {
    :text {label="Описание"; key="ptxt-081";}
    :list_box {key="txt-1001"; list=""; width=60; height=7; }//list_box
  }//column
}//row

:column {
	:text {label="Выбрано"; }//text
	:list_box {label=""; key="txt-901"; list=""; width=3; height=8; value= "0";}
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
