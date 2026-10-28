///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_01_safety_barrier_elesi: dialog {label = "БИЗ ЭлеСи";

:row {label="";
  :column {
    :text {label="Тип сигнала";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=20; height=8; }//list_box
  }//column

  :column {
    :text {label="Модель";}
    :text {label="";}
    :list_box {key="txt-02"; list=""; width=10; height=8; }//list_box
  }//column

  :column {
    :text {label="Кол.";}
    :text {label="каналов";}
    :list_box {key="txt-03"; list=""; width=10; height=8; }//list_box
  }//column

  :column {
    :text {label="Вход";}
    :text {label="";}
    :list_box {key="txt-04"; list=""; width=30; height=8; }//list_box
  }//column

  :column {
    :text {label="Выход";}
    :text {label="";}
    :list_box {key="txt-05"; list=""; width=28; height=8; }//list_box
  }//column

  :column {
    :text {label="Взрывозащита";}
    :text {label="";}
    :list_box {key="txt-06"; list=""; width=15; height=8; }//list_box
  }//column

  :column {
    :text {label="Потр.";}
    :text {label="мощн., Вт";}
    :list_box {key="txt-07"; list=""; width=10; height=8; }//list_box
  }//column

  :column {
    :text {label="Масса,";}
    :text {label="кг";}
    :list_box {key="txt-99"; list=""; width=10; height=8; }//list_box
  }//column
}//row

:row {label="";
  :column {
    :text {label="Описание";}
    :list_box {key="txt-900"; list=""; width=60; height=5; }//list_box
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
