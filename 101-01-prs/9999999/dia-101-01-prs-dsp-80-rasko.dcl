///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_dsp_80_rasko: dialog {label = "Дифманометр";

:row {label="";
  :column {label="";
    :text {label="Модель";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=20; height=7; value=0;}//list_box
  }//column

  :column {label="";  
  	:text {label="Перепад давления,";}
    :text {label="кПа";}
    :list_box {key="txt-02"; list=""; width=20; height=7; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Макс. давление,"; key="ptxt-031";}
    :text {label="МПа"; key="ptxt-032";}
    :list_box {key="txt-03"; list=""; width=20; height=7; value=0;}//list_box
  }//column
  
  :column {label="";
    :text {label="Предел осн."; key="ptxt-041";}
    :text {label="погрешн., %"; key="ptxt-042";}
    :list_box {key="txt-04"; list=""; width=20; height=7; value=0;}//list_box
  }//column
  
  :column {label="";
    :text {label="Кронштейн"; key="ptxt-051";}
    :text {label=""; key="ptxt-052";}
    :list_box {key="txt-05"; list=""; width=20; height=7; value=0;}//list_box
  }//column
  
  :column {label="";
    :text {label="Присоединение"; key="ptxt-061";}
    :text {label=""; key="ptxt-062";}
    :list_box {key="txt-06"; list=""; width=40; height=7; value=0;}//list_box
  }//column 

  :column {label="";
    :text {label="Дополнительно"; key="ptxt-071";}
    :text {label=""; key="ptxt-072";}
    :list_box {key="txt-07"; list=""; width=20; height=7; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Производитель"; key="ptxt-081";}
    :text {label=""; key="ptxt-082";}
    :list_box {key="txt-08"; list=""; width=20; height=7; value=0;}//list_box
  }//column
  
}//row

:row {label=""; height=1;}

:row {label="";
	:column {label="";
		:text {label=""; key="ptxt-801"; value="УДПИ - устройство дистанционной передачи данных.";}
		:text {label=""; key="ptxt-802"; value="УДПИ - релейный выход.  УДПИ42 (УДПИ42Ех) выход релейный, 4мА (0), 20мА (1).";}
	}//column
}//row

:row {label="";
	:button {label="Запомнить"; key="but1"; height=1;}
	:button {label="ПЭ"; key="but2"; height=1;}
	:button {label="СПЦФ"; key="but3"; height=1;}
	:button {label="Удалить"; key="but5"; height=1;}
	:button {label="Вверх"; key="but6"; height=1;}
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
