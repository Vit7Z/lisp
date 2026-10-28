///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_temp_owen_dts: dialog {label = "ОВЕН ДТС для измерения температуры воздуха";

:row {label="";
  :column {
    :text {label="Модель";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=12; height=7; }//list_box
  }//column  

  :column {
    :text {label="НСХ"; key="ptxt-21";}
    :text {label=""; key="ptxt-22";}
    :list_box {key="txt-02"; list=""; width=8; height=7; }//list_box
  }//column

  :column {
    :text {label="Класс"; key="ptxt-31";}
    :text {label="допуска"; key="ptxt-32";}
    :list_box {key="txt-03"; list=""; width=10; height=7; }//list_box
  }//column

  :column {
    :text {label="Диапазон"; key="ptxt-41";}
    :text {label="температур"; key="ptxt-42";}
    :list_box {key="txt-04"; list=""; width=14; height=7; }//list_box
  }//column

  :column {
    :text {label="Схема"; key="ptxt-51";}
    :text {label="соединения"; key="ptxt-52";}
    :list_box {key="txt-05"; list=""; width=16; height=7; }//list_box
  }//column

  :column {
    :text {label="Длина,"; key="ptxt-61";}
    :text {label="мм"; key="ptxt-62";}
    :list_box {key="txt-06"; list=""; width=8; height=7; }//list_box
  }//column  

  :column {
    :text {label="Масса,"; key="ptxt-71";}
    :text {label="кг"; key="ptxt-72";}
    :list_box {key="txt-99"; list=""; width=8; height=7;}//list_box
  }//column
}//row

:row {
	:list_box {key="txt-900"; list=""; width=10; height=3; is_enabled=falshe;}
}//row


:toggle {label="Экран защитный"; key="tgl-01";}

:row {label="";
	:button {label="Запомнить"; key="but-1"; height=1;}
	:button {label="ПЭ"; key="but-2"; height=1;}
	:button {label="СПЦФ"; key="but-3"; height=1;}
	ok_only;
}//row

:row {label="";
	:column {
		:text {label="Выбрано"; }//text
		:list_box {label=""; key="txt-901"; list=""; width=18; height=8; value= "0";}
	}//column
}//row


}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
