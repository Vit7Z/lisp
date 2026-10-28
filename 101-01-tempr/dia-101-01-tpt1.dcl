///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_tpt_1: dialog {label = "\"Термико\" ТПТ, ТМТ";

:row {label="";

  :column {
    :text {label="Тип";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=15; height=18;}//list_box
  }//column  

  :column {
    :text {label="Диапазон";}
    :text {label="температур";}
    :list_box {key="txt-02"; list=""; width=10; height=18;}//list_box
  }//column

  :column {
    :text {label="НСХ";}
    :text {label="";}
    :list_box {key="txt-03"; list=""; width=10; height=18;}//list_box
  }//column 

  :column {
    :text {label="Класс";}
    :text {label="допуска";}
    :list_box {key="txt-04";
     list="";
     width=10;
     height=18;
    }//list_box
  }//column

  :column {
    :text {label="Схема";}
    :text {label="соединения";}
    :list_box {key="txt-05";
     list="";
     width=10;
     height=18;
    }//list_box
  }//column

  :column {
    :text {label="Монтажная";}
    :text {label="длина, мм.";}
    :list_box {key="txt-06"; list=""; width=10; height=18;}//list_box
  }//column
  
  :column {
    :text {label="Диаметр";}
    :text {label="монтажн. части";}
    :list_box {key="txt-07"; list=""; width=3; height=18;}//list_box
  }//column 

  :column {
    :text {label="Штуцер";}
    :text {label="приварной";}
    :list_box {key="txt-08"; list=""; width=3; height=18;}//list_box
  }//column 
}//row

:row {label="";
	:text {label=""; key="ptxt-061";}
}//row

:column {label="";
	:text {label="Выбрано"; }//text
	:list_box {label=""; key="txt-901"; list=""; width=50; height=10; value="0";}
}//column

:row {label="";
	:button {label="Запомнить"; key="but1"; height=1;}
	:button {label="ПЭ"; key="but2"; height=1;}
	:button {label="СПЦФ"; key="but3"; height=1;}
	:button {label="Удалить"; key="but5"; height=1;}
	ok_only;
}//row
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////
