///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_04_auto_abb_prom_compact: dialog {label = "ABB Pro M Compact";

:row {label="";
  :column {label="";
    :text {label="Наименование,";}
    :text {label="характеристика";}
    :list_box {key="txt-01"; list=""; width=26; height=18; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Iном, А"; key="hm-21";}
    :text {label=""; key="hm-22";}
    :list_box {key="txt-02"; list=""; width=10; height=18; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Модель"; key="hm-31";}
    :text {label=""; key="hm-32";}
    :list_box {key="txt-03"; list=""; width=22; height=18; value=0;}//list_box
  }//column
 
  :column {label="";
    :text {label="Код заказа"; key="hm-41";}
    :text {label=""; key="hm-42";}
    :list_box {key="txt-04"; list=""; width=20; height=18; value=0;}//list_box
  }//column  

  :column {label="";
    :text {label="Масса,";}
    :text {label="кг";}
    :list_box {key="txt-05"; list=""; width=8; height=18; value=0;}//list_box
  }//column

	:column {label="";
		:text {label="Выбрано"; }//text
		:text {label="";}
		:list_box {label=""; key="txt-901"; list=""; width=55; height=18; value= "0";}
	}//column

}//row

:row {label="";
	:list_box {key="txt-900"; list="";height=5; value=0;}//list_box
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
