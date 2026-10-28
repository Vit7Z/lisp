///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_clmp_phnix_cnt_01_general: dialog {label = "Клеммы Klemsan + акссессуары";

:row {label="";
  :column {
    :text {label="Тип";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=34; height=15; value=0;}//list_box
  }//column
  
  :column {
    :text {label="Обозначение";}
    :text {label="";}
    :list_box {key="txt-02"; list=""; width=16; height=15; value=0;}//list_box
  }//column

  :column {
    :text {label="Артикул";}
    :text {label="";}
    :list_box {key="txt-03"; list=""; width=12; height=15; value=0;}//list_box
  }//column

  :column {
    :text {label="Кол. ярусов,"; key="mln-41";}
    :text {label="Ширина, мм"; key="mln-42";}
    :list_box {key="txt-04"; list=""; width=14; height=15; value=0;}//list_box
  }//column

  :column {
    :text {label="Сечение"; key="mln-51";}
    :text {label="жилы, мм2"; key="mln-52";}
    :list_box {key="txt-05"; list=""; width=12; height=15; value=0;}//list_box
  }//column
  
  :column {
    :text {label="Цвет"; key="mln-61";}
    :text {label=""; key="mln-62";}
    :list_box {key="txt-06"; list=""; width=20; height=15; value=0;}//list_box
  }//column  
  
  :column {
  	:text {label="Кол. подкл."; key="mln-71";}
    :text {label="проводников"; key="mln-72";}
    :list_box {key="txt-07"; list=""; width=14; height=15; value=0;}//list_box
  }//column

  :column {
    :text {label="Зажим"; key="mln-81";}
    :text {label=""; key="mln-82";}
    :list_box {key="txt-08"; list=""; width=20; height=15; value=0;}//list_box
  }//column
}//row

:row {label="";
	:column {
		:text {label="Описание";}
		:list_box {label=""; key="txt-900"; list=""; width=30; height=5;}
	}//column
}//row


:row {label="";
	:column {
		:text {label="Выбрано";}
		:list_box {label=""; key="txt-901"; list=""; width=30; height=10; value= "0";}
	}//column
}//row

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
