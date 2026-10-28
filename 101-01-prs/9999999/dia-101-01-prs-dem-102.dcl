///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_dem_102: dialog {label = "Датчик-реле давления";

:row {label="";

  :column {label="";  
  	:text {label="Модель";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=20; height=7; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Пределы уставок,"; key="ptxt-031";}
    :text {label="МПа"; key="ptxt-032";}
    :list_box {key="txt-02"; list=""; width=20; height=7; value=0;}//list_box
  }//column
  
  :column {label="";
    :text {label="Макс. давл.,"; key="ptxt-041";}
    :text {label="МПа"; key="ptxt-042";}
    :list_box {key="txt-03"; list=""; width=20; height=7; value=0;}//list_box
  }//column
  
  :column {label="";
    :text {label="Присоединение"; key="ptxt-051";}
    :text {label=""; key="ptxt-052";}
    :list_box {key="txt-04"; list=""; width=20; height=7; value=0;}//list_box
  }//column
  
  :column {label="";
    :text {label="Ввод кабеля"; key="ptxt-061";}
    :text {label=""; key="ptxt-062";}
    :list_box {key="txt-05"; list=""; width=20; height=7; value=0;}//list_box
  }//column 

  :column {label="";
    :text {label="Производитель"; key="ptxt-071";}
    :text {label=""; key="ptxt-072";}
    :list_box {key="txt-06"; list=""; width=20; height=7; value=0;}//list_box
  }//column

}//row

:row {label=""; height=1;  
}//row

:row {label="";
	:button {label="Запомнить"; key="but1"; height=1;}
	:button {label="ПЭ"; key="but2"; height=1;}
	:button {label="СПЦФ"; key="but3"; height=1;}
	:button {label="Удалить"; key="but5"; height=1;}
	:button {label="Вверх"; key="but6"; height=1;}
	ok_only;
}//row

:column {
	:text {label="Выбрано"; }//text
	:list_box {label=""; key="txt-901"; list=""; width=18; height=8; value= "0";}
}//column

}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
