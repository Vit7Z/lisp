///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_01_sec_dev_moxa: dialog {label = "Сетевое оборудование MOXA";

:row {label="";
  :column {
    :text {label="Тип оборудования";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=30; height=7;}//list_box
  }//column

  :column {
    :text {label="Модель";}
    :text {label="";}
    :list_box {key="txt-02"; list=""; width=25; height=7;}//list_box
  }//column

  :column {
    :text {label="Интерфейсы"; key="ptxt-31";}
    :text {label=""; key="ptxt-32";}
    :list_box {key="txt-03"; list=""; width=60; height=7;}//list_box
  }//column

  :column {
    :text {label="Uпит, В"; key="ptxt-41";}
    :text {label=""; key="ptxt-42";}
    :list_box {key="txt-04"; list=""; width=10; height=7;}//list_box
  }//column

  :column {
    :text {label="Монтаж"; key="ptxt-51";}
    :text {label=""; key="ptxt-52";}
    :list_box {key="txt-05"; list=""; width=12; height=7; }//list_box
  }//column

  :column {
    :text {label="Масса,"; key="ptxt-61";}
    :text {label="кг"; key="ptxt-62";}
    :list_box {key="txt-06"; list=""; width=5; height=7; }//list_box
  }//column
}//row

:row {label="";
  :column {
    :text {label="Особенности";}
    :list_box {key="txt-900"; list=""; width=60; height=5; }//list_box
  }//column
}//row

:column {
	:text {label="Выбрано"; }//text
	:list_box {label=""; key="txt-901"; list=""; width=3; height=8; value= "0";}
}//column

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
