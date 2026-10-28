///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_04_auto_abb_series_ms: dialog {label = "ABB MS";

:row {label="";
  :column {label="";
    :text {label="Тип";}
    :text {label="оборудования";}
    :list_box {key="txt-01"; list=""; width=20; height=15; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Обозначение";}
    :text {label="";}
    :list_box {key="txt-02"; list=""; width=28; height=15; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Код заказа";}
    :text {label="";}
    :list_box {key="txt-03"; list=""; width=18; height=15; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Iном, А"; key="ptxt-41";}
    :text {label=""; key="ptxt-42";}
    :list_box {key="txt-04"; list=""; width=10; height=15; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Icu ~380В,"; key="ptxt-51";}
    :text {label="кА"; key="ptxt-52";}
    :list_box {key="txt-05"; list=""; width=12; height=15; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Масса,";}
    :text {label="кг";}
    :list_box {key="txt-99"; list=""; width=8; height=15; value=0;}//list_box
  }//column  

	:column {label="";
		:text {label="Выбрано"; }//text
		:text {label="";}
		:list_box {label=""; key="txt-901"; list=""; width=60; height=15; value= "0";}
	}//column

}//row

:row {label="";
	:list_box {key="txt-900"; list=""; height=5; value=0;}//list_box
}//row

:row {label="";
	:button {label="Запомнить"; key="but1"; height=1;}
	:button {label="ПЭ"; key="but2"; height=1;}
	:button {label="СПЦФ"; key="but3"; height=1;}
	:button {label="ОВШ"; key="but4"; height=1;}
	:button {label="Удалить"; key="but5"; height=1;}
	:button {label="Вверх"; key="but6"; height=1;}
	ok_only;
}//row
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
