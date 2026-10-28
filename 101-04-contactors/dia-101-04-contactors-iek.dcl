///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_04_contactors_iek: dialog {label = "";

:row {label="";
  :column {label="";
    :text {label="Модель, тип";}
    :text {label="оборудования";}
    :list_box {key="txt-00"; list=""; width=30; height=15; value=0;}
  }//column
  
  :column {label="";
    :text {label="Наименование";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=40; height=15; value=0;}
  }//column

  :column {label="";
    :text {label="Iном.,"; key="ptxt-021";}
    :text {label="А"; key="ptxt-022";}
    :list_box {key="txt-02"; list=""; width=10; height=15; value=0;}
  }//column

  :column {label="";
    :text {label="Uупр.,"; key="ptxt-031";}
    :text {label="В"; key="ptxt-032";}
    :list_box {key="txt-03"; list=""; width=10; height=15; value=0;}
  }//column
 
  :column {label="";
    :text {label="Доп."; key="ptxt-041";}
    :text {label="контакты"; key="ptxt-042";}
    :list_box {key="txt-04"; list=""; width=15; height=15; value=0;}
  }//column  
  
  :column {label="";
    :text {label="Артикул"; key="ptxt-051";}
    :text {label=""; key="ptxt-052";}
    :list_box {key="txt-05"; list=""; width=20; height=15; value=0;}
  }//column

  :column {label="";
    :text {label="Кол."; key="ptxt-061";}
    :text {label="полюсов"; key="ptxt-062";}
    :list_box {key="txt-06"; list=""; width=10; height=15; value=0;}//list_box
  }//column
}//row

:row {label="";
	:text {label=""; key="ptxt-071"; value="Контакторы общего назначения.";}
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