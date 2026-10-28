///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_01_secondary_device_albatros: dialog {label = "Альбатрос";

:row {label="";
  :column {
    :text {label="Модель";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=10; height=15; }//list_box
  }//column

  :column {
    :text {label="Кол.";}
    :text {label="каналов";}
    :list_box {key="txt-02"; list=""; width=10; height=15; }//list_box
  }//column

  :column {
    :text {label="Тип входа";}
    :text {label="";}
    :list_box {key="txt-03"; list=""; width=10; height=15; }//list_box
  }//column

  :column {
    :text {label="Тип выхода";}
    :text {label="";}
    :list_box {key="txt-04"; list=""; width=10; height=15; }//list_box
  }//column

  :column {
    :text {label="Описание";}
    :text {label="";}
    :list_box {key="txt-05"; list=""; width=60; height=15; }//list_box
  }//column

  :column {
    :text {label="Масса,";}
    :text {label="кг";}
    :list_box {key="txt-99"; list=""; width=10; height=15; }//list_box
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
