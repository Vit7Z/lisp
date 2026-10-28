///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_01_sec_dev_uppo: dialog {label = "БИЗ \"УППО\"";

:row {label="";
  :column {
    :text {label="Тип сигнала";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=25; height=15; }//list_box
  }//column

  :column {
    :text {label="Модель";}
    :text {label="";}
    :list_box {key="txt-02"; list=""; width=10; height=15; }//list_box
  }//column

  :column {
    :text {label="Кол.";}
    :text {label="каналов";}
    :list_box {key="txt-03"; list=""; width=10; height=15; }//list_box
  }//column

  :column {
    :text {label="Вход";}
    :text {label="";}
    :list_box {key="txt-04"; list=""; width=35; height=15; }//list_box
  }//column

  :column {
    :text {label="Выход";}
    :text {label="";}
    :list_box {key="txt-05"; list=""; width=35; height=15; }//list_box
  }//column

  :column {
    :text {label="Взрывозащита";}
    :text {label="";}
    :list_box {key="txt-06"; list=""; width=15; height=15; }//list_box
  }//column

  :column {
    :text {label="Эл.";}
    :text {label="питание";}
    :list_box {key="txt-07"; list=""; width=15; height=15; }//list_box
  }//column

  :column {
    :text {label="Масса,";}
    :text {label="кг";}
    :list_box {key="txt-99"; list=""; width=10; height=15; }//list_box
  }//column
}//row

:row {label="";
  :column {
    :text {label="Описание";}
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
