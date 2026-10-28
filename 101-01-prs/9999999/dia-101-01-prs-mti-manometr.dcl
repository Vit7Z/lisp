///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_mti: dialog {label = "Манометры точных измерений";

:row {label="";
  :column {label="";
    :text {label="Наименование";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=20; height=7; value=0;}//list_box
  }//column

  :column {label="";  
  	:text {label="Модель";}
    :text {label="";}
    :list_box {key="txt-02"; list=""; width=20; height=7; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Единицы изм."; key="ptxt-031";}
    :text {label=""; key="ptxt-032";}
    :list_box {key="txt-03"; list=""; width=20; height=7; value=0;}//list_box
  }//column
  
  :column {label="";
    :text {label="Предел изм."; key="ptxt-041";}
    :text {label=""; key="ptxt-042";}
    :list_box {key="txt-04"; list=""; width=20; height=7; value=0;}//list_box
  }//column
  
  :column {label="";
    :text {label="Расположение"; key="ptxt-051";}
    :text {label="штуцера"; key="ptxt-052";}
    :list_box {key="txt-05"; list=""; width=20; height=7; value=0;}//list_box
  }//column
}//row

:row {label=""; height=1;}

:row {label="";
  :column {label="";
    :text {label="Степень"; key="ptxt-061";}
    :text {label="защиты"; key="ptxt-062";}
    :list_box {key="txt-06"; list=""; width=20; height=7; value=0;}//list_box
  }//column 

  :column {label="";
    :text {label="Класс"; key="ptxt-071";}
    :text {label="точности"; key="ptxt-072";}
    :list_box {key="txt-07"; list=""; width=20; height=7; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Климатич."; key="ptxt-081";}
    :text {label="исп."; key="ptxt-082";}
    :list_box {key="txt-08"; list=""; width=20; height=7; value=0;}//list_box
  }//column
  
  :column {label="";
    :text {label="Присоед."; key="ptxt-091";}   
    :text {label="резьба"; key="ptxt-092";} 
    :list_box {key="txt-09"; list=""; width=20; height=7; value=0;}
  }//column
  
	:column {label="";
    :text {label="Среда"; key="ptxt-101";}
    :text {label="";}
    :list_box {key="txt-10"; list=""; width=20; height=7; value=0;}//list_box
  }//column 
}//row

:row {label="";
	:text {label=""; key="ptxt-801";}
	:text {label=""; key="ptxt-802";}
}//row

:row {label="";
	:button {label="Запомнить"; key="but1"; height=1;}
	:button {label="ПЭ"; key="but2"; height=1;}
	:button {label="СПЦФ"; key="but3"; height=1;}
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
