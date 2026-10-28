///////////////////////////////////////////////////////////////////////////////////////////////////////////
101_secondary_device_trm32: dialog {label = "ТРМ32";

:row {label="";
  :column {
    :text {label="Наименование, Модель"; key="ptxt-011";}
    :text {label=""; key="ptxt-012";}
    :list_box {key="txt-01"; list=""; width=36; height=16; }//list_box
  }//column  

  :column {
    :text {label="Вход 1"; key="ptxt-021";}
    :text {label=""; key="ptxt-022";}
    :list_box {key="txt-02"; list=""; width=26; height=7; }//list_box
    :text {label="Вход 2"; key="ptxt-031";}
    :list_box {key="txt-03"; list=""; width=26; height=7; }//list_box
  }//column

  :column {
    :text {label="Выход 1"; key="ptxt-041";}
    :text {label=""; key="ptxt-042";}
    :list_box {key="txt-04"; list=""; width=34; height=7; }//list_box
  
    :text {label="Выход 2"; key="ptxt-051";}
    :list_box {key="txt-05"; list=""; width=34; height=7; }//list_box
  }//column

  :column {
    :text {label="Исполнение"; key="ptxt-061";}
    :text {label=""; key="ptxt-062";}
    :list_box {key="txt-06"; list=""; width=34; height=16; }//list_box
  }//column

  :column {
    :text {label="Интерфейс"; key="ptxt-071";}
    :text {label=""; key="ptxt-072";}
    :list_box {key="txt-07"; list=""; width=10; height=16; }//list_box
  }//column

  :column {
    :text {label="Дополнительное"; key="ptxt-081";}
    :text {label="описание"; key="ptxt-082";}
    :list_box {key="txt-08"; list=""; width=40; height=16; }//list_box
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
