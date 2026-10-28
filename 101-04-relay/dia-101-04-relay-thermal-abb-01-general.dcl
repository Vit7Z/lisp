///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_04_relay_abb_overload: dialog {label = "Реле перегрузки ABB";

:row {label="";
  :column {label="";
    :text {label="Модель";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=20; height=10; value=0;}//list_box
  }//column
 
  :column {label="";
    :text {label="Тип";}
    :text {label="";}
    :list_box {key="txt-02"; list=""; width=10; height=10; value=0;}//list_box
  }//column 
 
  :column {label="";
    :text {label="Код заказа"; key="menu-31";}
    :text {label=""; key="menu-32";}
    :list_box {key="txt-03"; list=""; width=18; height=10; value=0;}//list_box
  }//column
 
  :column {label="";
    :text {label="Iуст, А"; key="menu-41";}
    :text {label=""; key="menu-42";}
    :list_box {key="txt-04"; list=""; width=10; height=10; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Возврат"; key="menu-51";}
    :text {label=""; key="menu-52";}
    :list_box {key="txt-05"; list=""; width=12; height=10; value=0;}//list_box
  }//column
 
  :column {label="";
    :text {label="Монтаж"; key="menu-61";}
    :text {label=""; key="menu-62";}
    :list_box {key="txt-06"; list=""; width=12; height=10; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Масса,"; key="menu-71";}
    :text {label="кг"; key="menu-72";}
    :list_box {key="txt-07"; list=""; width=8; height=10; value=0;}//list_box
  }//column
}//row

:row {label="";
	:column {label="";
		:text {label="Описание";}
		:list_box {key="txt-900"; list=""; height=5; value=0;}//list_box
	}//column
}//row

:column {label="";
	:text {label="Выбрано"; }//text
	:list_box {label=""; key="txt-901"; list=""; width=50; height=10; value= "0";}
}//column

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
