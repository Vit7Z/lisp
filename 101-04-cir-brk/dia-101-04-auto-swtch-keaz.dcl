///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_04_auto_swtch_keaz: dialog {label = "";

:row {label="";

  :column {label="";
    :text {label="Модель";}
    :text {label="";}
    :text {label="";}
    :list_box {key="txt-00"; list=""; width=20; height=10; value=0;}
  }//column

  :column {label="";
    :text {label="Номинальный";}
    :text {label="ток, А";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=15; height=10; value=0;}
  }//column

  :column {label="";
    :text {label="Кол.";}
    :text {label="полюсов";}
    :text {label="";}
    :list_box {key="txt-02"; list=""; width=15; height=10; value=0;}
  }//column
 
  :column {label="";
    :text {label="Напржение";}
    :text {label="до, В";}
    :text {label="";}
    :list_box {key="txt-03"; list=""; width=15; height=10; value=0;}//list_box
  }//column  
  
  :column {label="";
    :text {label="Уставка по";}
    :text {label="току мгновен.";}
    :text {label="срабатыван.";}
    :list_box {key="txt-04"; list=""; width=15; height=10; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Эл. магнитн.";}
    :text {label="расцепитель";}
    :text {label="";}
    :list_box {key="txt-05"; list=""; width=15; height=10; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Тепловой";}
    :text {label="расцепитель";}
    :text {label="";}
    :list_box {key="txt-06"; list=""; width=15; height=10; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Свободные";}
    :text {label="контакты";}
    :text {label="";}
    :list_box {key="txt-07"; list=""; width=15; height=10; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Климатическое";}
    :text {label="исполнение";}
    :text {label="";}
    :list_box {key="txt-08"; list=""; width=34; height=10; value=0;}//list_box
  }//column

}//row

:row {label="";
	:column {label="";
		:text {label="Выбрано";}
		:list_box {label=""; key="txt-901"; list=""; width=60; height=10; value= "0";}
	}//column
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
