///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_01_sec_dev_hmi_weintek: dialog {label = "HMI \"Weintek\"";

:row {label="";
  :column {
    :text {label="Модель";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=15; height=15; }//list_box
  }//column

  :column {
    :text {label="Диагональ";}
    :text {label="";}
    :list_box {key="txt-02"; list=""; width=10; height=15; }//list_box
  }//column

  :column {
    :text {label="Uпит,";}
    :text {label="";}
    :list_box {key="txt-03"; list=""; width=15; height=15; }//list_box
  }//column

  :column {
    :text {label="Описание";}
    :text {label="";}
    :list_box {key="txt-900"; list=""; width=120; height=15; }//list_box
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
