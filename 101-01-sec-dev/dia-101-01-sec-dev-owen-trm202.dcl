///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_01_secondary_device_2trm1: dialog {label = "ТРМ202";

:row {label="";
  :column {
    :text {label="Вход 1";}
    :list_box {key="txt-02"; list=""; width=15; height=7; }//list_box
    
    :text {label="Вход 2";}
    :list_box {key="txt-03"; list=""; width=15; height=7; }//list_box
  }//column

  :column {
    :text {label="Выход 1";}
    :list_box {key="txt-04"; list=""; width=38; height=7; }//list_box
  
    :text {label="Выход 2";}
    :list_box {key="txt-05"; list=""; width=38; height=7; }//list_box
  }//column

  :column {
    :text {label="Исполнение";}
    :list_box {key="txt-06"; list=""; width=45; height=16; }//list_box
  }//column

  :column {
    :text {label="Описание"; key="ptxt-081";}
    :list_box {key="txt-1001"; list=""; width=85; height=16; }//list_box
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
